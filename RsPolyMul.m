%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsPolyMul.m
% 功能：
%    GF(2^4)元素的多项式乘法
% 输入：
%    LPoly,RPoly：乘数多项式,长度分别为len1和len2
% 输出：
%    PolyProduct：相乘所得的多项式,长度为len1+len2-1
%*************************************************************************

function [PolyProduct] = RsPolyMul(LPoly,RPoly)

len1 = length (LPoly);
len2 = length (RPoly);
len = len1 + len2 -1;
PolyProduct = zeros(1,len);

for i=1:len1
    TempPoly = zeros(1,len2);
    for j=1:len2
        TempPoly(j) = RsSymbolMul(LPoly(i),RPoly(j));
    end
    PolyProduct(i:i+len2-1) = RsPolyAdd(PolyProduct(i:i+len2-1),TempPoly);
end