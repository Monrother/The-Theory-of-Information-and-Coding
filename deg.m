%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    deg.m
% 功能：
%    计算多项式最高次项的次数
% 输入：
%	 Poly：维数未知的多项式
% 输出：
%	 degree：多项式的维数
%*************************************************************************

function [degree]=deg(Poly)

len=length(Poly);
degree=0;
for index=len:-1:1
    if Poly(index)~=0
        degree=index-1;
        return;
    end
end