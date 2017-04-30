%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsPolyAdd.m
% 功能：
%    GF(2^4)元素的多项式加法子模块
% 输入：
%    Poly1,Poly2：待加的多项式,长度分别是len1和len2
% 输出：
%    Output：相加所得的多项式,长度为len1与len2的较大值
%*************************************************************************

function [Output] = RsPolyAdd(Poly1,Poly2)

len1 = length(Poly1);
len2 = length(Poly2);
if len1 >= len2
    Output = Poly1;
    len = len2;
else
    Output = Poly2;
    len = len1;
end  

for i=1:len
    Output(i) = RsSymbolAdd(Poly1(i),Poly2(i));
end
