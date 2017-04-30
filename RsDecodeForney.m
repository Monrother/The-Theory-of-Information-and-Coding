%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSecodeForney.m
% 功能：
%    错误位置多项式计算子模式
% 输入：
%    SyndromCalc:伴随多项式，为1*2t(t=2)的矢量
%    ErrorPosPolyCalc：错误位置多项式，1*(2t+2)的矢量，其维度m为信道加入的错误个数，m<=t，t=2
%    RootCalc:错误位置,1*m的矢量,其维度m为信道加入的错误个数，m<=t，t=2
% 输出: 
%    ErrorPositionCalc：错误位置矢量，1*m的矢量，其中m为信道加入的错误个数，m<=t，t=2,用alpha值表示
%    ErrorValueCalc：错误数值矢量，1*m的矢量，其中m为信道加入的错误个数，m<=t，t=2
%*************************************************************************

function [ErrorValueCalc, ErrorPositionCalc] = RsDecodeForney(SyndromCalc, ErrPosPolyCalc, RootCalc);
Index1 = [1, 2, 4, 8, 3, 6, 12, 11, 5, 10, 7, 14, 15, 13, 9];
Index2 = [0, 1, 4, 2, 8, 5, 10, 3, 14, 9, 7, 6, 13, 11, 12];
t=2;
len1 = length(RootCalc);
ErrorPositionCalc = zeros(1, len1);
ErrorValueCalc = zeros(1, len1);
%计算错误位置
ErrorRootVal = [];
for ii = 1:len1
	temp = RsSymbolRev(RootCalc(ii));
	ErrorRootVal = [ErrorRootVal, temp];
	ErrorPositionCalc(ii) = Index2(temp);
end;
%升序排列
ErrorPositionCalc = sort(ErrorPositionCalc);

%计算错误数值
W = RsPolyMul(SyndromCalc, ErrPosPolyCalc);
W = W(1:2*t);
len2 = length(ErrPosPolyCalc);
DeltaErrPosPolyCalc = ErrPosPolyCalc(2:len2);
ErrPosPolyCalc;
for ii = 2:len2
	if(mod(ii-1, 2) == 0)
		DeltaErrPosPolyCalc(ii-1) = 0;
	else
		DeltaErrPosPolyCalc(ii-1) = ErrPosPolyCalc(ii);
	end;
end;
len3 = length(DeltaErrPosPolyCalc);
len4 = length(W);
ErrorValueCalc = zeros(1, len1);
for ii = 1:len1
	temp_w = 0;
	temp_Delta = 0;
	for jj = 1:len3
		flag = Index2(ErrorRootVal(ii));
		pointer = mod(flag*(jj-1), 15)+1;
		temp_Delta = RsSymbolAdd(temp_Delta, RsSymbolMul(DeltaErrPosPolyCalc(jj), Index1(pointer)));
	end;
	for jj = 1:len4
		flag = Index2(ErrorRootVal(ii));
		pointer = mod(flag*(jj-1), 15)+1;
		temp_w = RsSymbolAdd(temp_w, RsSymbolMul(W(jj), Index1(pointer)));
	end;
	if(temp_Delta ==0)%如果没有出错，则ErrorValueCalc = 0
		ErrorValue(ii) = 0;
	else
		ErrorValueCalc(ii) = RsSymbolDiv(temp_w, temp_Delta);
	end;
end;

