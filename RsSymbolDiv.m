%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSymbolDiv.m
% 功能：
%    GF(2^4)元素的除法子模块
% 输入：
%    LOperand: 被除数，十进制表示
%    ROperand：除数，十进制表示
% 输出：
%    Quotient：元素相除之商，十进制表示
%*************************************************************************

function [Quotient] = RsSymbolDiv(LOperand,ROperand)

M = 4; % GF(2^4)

if LOperand == 0
    Quotient = 0;
    return;
elseif ROperand == 0
    Quotient = inf;
    return;
end  

LOperand_alpha = Dec2Alpha(LOperand);
ROperand_alpha = Dec2Alpha(ROperand);
alpha = mod (LOperand_alpha - ROperand_alpha, 2^M-1);
Quotient = Alpha2Dec(alpha);