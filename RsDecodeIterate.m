%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSecodeIterate.m
% 功能：
%    错误位置多项式计算子模式
% 输入：
%    Syndrome：接收RS码序列的伴随多项式，为1*2t(t=2)的矢量。
% 输出：
%    ErrorPosPolyCalc：在伴随多项式的基础上，根据迭代法得到的错误位置多项式，
% 1*(2t+2)的矢量，其维度m为信道加入的错误个数，m<=t，t=2
%    SigmaCalc：存储迭代算法中每次迭代（共有2t次迭代）中多项式delta(j)(x)，
% 以其升幂系数向量方式存储，SigmaCalc矢量有2t+2行，2t+2列。
%*************************************************************************

function [ErrorPosPolyCalc, SigmaCalc] = RsDecodeIterate(SyndromCalc);
n = 15;
t = 2;
L = 0;
x = 1;
Sigma_i = [1];
Sigma_j = [1];
SigmaCalc = [1;1];%
d_i = 1;
N = 0;
while N < 2*t
	sum = 0;
	for ii = 1:L
		sum = RsSymbolAdd(sum, RsSymbolMul(Sigma_j(ii+1), SyndromCalc(N+1-ii)));
	end;
	d_j = RsSymbolAdd(SyndromCalc(N+1), sum);
	if(d_j == 0)
		x = x + 1;
	else
		if(2*L > N)
			d = RsSymbolDiv(d_j, d_i);
			x_j_i = zeros(1, x+1);
			x_j_i(x+1) = d;
			Sigma_j = RsPolySub(Sigma_j, RsPolyMul(x_j_i, Sigma_i));
			x = x + 1;
		else
			temp = Sigma_j;
			d = RsSymbolDiv(d_j, d_i);
			x_j_i = zeros(1, x+1);
			x_j_i(x+1) = d;
			Sigma_j = RsPolySub(Sigma_j, RsPolyMul(x_j_i, Sigma_i));
			Sigma_i = temp;
			L = N + 1 - L;
			d_i = d_j;
			x = 1;
		end;
	end;
	N = N + 1;
	[len1, len2] = size(SigmaCalc);
	if(length(Sigma_j) > len2)
		SigmaCalc = [SigmaCalc, zeros(len1, length(Sigma_j)-len2)];
	end;
	SigmaCalc(N+1,:) = Sigma_j;
end;
ErrorPosPolyCalc = Sigma_j;