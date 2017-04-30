%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsPolySub.m
% 功能：
%    GF(2^4)元素的多项式减法子模块
% 输入：
%    LPoly: 被减数多项式,长度为len1
%    RPoly：减数多项式,长度为len2
% 输出：
%    PolySub：相减所得的多项式,长度为len1与len2的较大值
%*************************************************************************

function [PolySub] = RsPolySub(LPoly,RPoly)

PolySub = RsPolyAdd(LPoly,RPoly);