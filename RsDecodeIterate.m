%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSecodeIterate.m
% ���ܣ�
%    ����λ�ö���ʽ������ģʽ
% ���룺
%    Syndrome������RS�����еİ������ʽ��Ϊ1*2t(t=2)��ʸ����
% �����
%    ErrorPosPolyCalc���ڰ������ʽ�Ļ����ϣ����ݵ������õ��Ĵ���λ�ö���ʽ��
% 1*(2t+2)��ʸ������ά��mΪ�ŵ�����Ĵ��������m<=t��t=2
%    SigmaCalc���洢�����㷨��ÿ�ε���������2t�ε������ж���ʽdelta(j)(x)��
% ��������ϵ��������ʽ�洢��SigmaCalcʸ����2t+2�У�2t+2�С�
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