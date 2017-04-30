%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSymbolMul.m
% 功能：
%    GF(2^4)元素的乘法子模块
% 输入：
%    LOperand,ROperand：待乘的元素，皆为十进制表示
% 输出：
%    Product：元素之和，十进制表示
%*************************************************************************

function [Product] = RsSymbolMul(LOperand,ROperand)

M = 4; % GF(2^4)
if LOperand*ROperand == 0
    Product = 0;
else
    LOperand_alpha = Dec2Alpha(LOperand);
    ROperand_alpha = Dec2Alpha(ROperand);
    alpha = mod (LOperand_alpha + ROperand_alpha, 2^M-1);
    Product = Alpha2Dec(alpha);
end