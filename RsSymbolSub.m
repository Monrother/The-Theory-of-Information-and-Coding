%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSymbolSub.m
% 功能：
%    GF(2^4)元素的减法子模块
% 输入：
%    LOperand: 被减数，十进制表示
%    ROperand：减数，十进制表示
% 输出：
%    Sub：元素之差，十进制表示
%*************************************************************************

function [Sub] = RsSymbolSub(LOperand,ROperand)

Sub = bitxor(LOperand,ROperand);