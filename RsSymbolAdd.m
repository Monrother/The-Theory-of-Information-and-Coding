%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSymbolAdd.m
% 功能：
%    GF(2^4)元素的加法子模块
% 输入：
%    LOperand,ROperand：待加的元素，皆为十进制表示
% 输出：
%    Output：元素之和，十进制表示
%*************************************************************************

function [Output] = RsSymbolAdd(LOperand,ROperand)

Output = bitxor(LOperand,ROperand);