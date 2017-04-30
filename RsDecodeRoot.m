%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSecodeRoot.m
% 功能：
%    错误位置多项式求根子模块
% 输入：
%    ErrorPosPoly：错误位置多项式，1*(2t+1)的矢量，其维度m为信道加入的错误个数，m<=t，t=2
% 输出:
%    Root：错误位置多项式的根，1*m的矢量，其中m为信道加入的错误个数，m<=t，t=2，并且用十进制数表示
% 算法:
%    试探法求根,将每一个元素作为x输入试探,如果是多项式的根,sigma(x)=0
%*************************************************************************

function [RootCalc] = RsDecodeRoot(ErrPosPolyCalc)
%采用试探的方法求根
Index1 = [1, 2, 4, 8, 3, 6, 12, 11, 5, 10, 7, 14, 15, 13, 9];
Index2 = [0, 1, 4, 2, 8, 5, 10, 3, 14, 9, 7, 6, 13, 11, 12];
len = length(ErrPosPolyCalc);
RootCalc = [];
flag = 1;
for ii = 1:15  %16进制中的数
	result = 0;
	for jj = 1:len
		flag = Index2(ii);
		pointer = mod(flag*(jj-1), 15) + 1;
		temp = RsSymbolMul(ErrPosPolyCalc(jj), Index1(pointer));
		result = RsSymbolAdd(result, temp);
	end;
	if result == 0
		RootCalc = [RootCalc, ii];
	end;
end;
		
	
	
