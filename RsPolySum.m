%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%	 RsPolySum.m
% 功能：计算两个多项式相乘的积的和
%	 即a(i)=x(i)*y(i),再将a的所有系数相加
% 输入：
%	 LPoly,RPoly：长度分别len1,len2的多项式
% 输出：
%	 PolySum：两个多项式相乘的积的和
%*************************************************************************

function [PolySum]=RsPolySum(LPoly,RPoly)

PolySum=0;
len1 = length(LPoly);
len2 = length(RPoly);
len = min(len1,len2);

for i=1:len
    PolySum = RsSymbolAdd(PolySum,RsSymbolMul(LPoly(i),RPoly(i)));
end