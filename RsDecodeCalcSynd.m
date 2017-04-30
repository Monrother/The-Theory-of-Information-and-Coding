%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSecodeCalcSynd.m
% 功能: 
%    伴随式计算子模块
% 输入:
%    RsCodeWithNoise:在指定位置加入了指定数值噪声的Rs编码序列，
%    同时，为了简化起见，规定此处错误个数额应不大于(15，11)RS码最大纠错数t=2
% 输出:
%    Syndrome:伴随多项式，为1*2t(t=2)的矢量
% 算法：
%    si=r(x=alpha^i)
% 本题中的伴随式图案如下：
% Graph3=[1 2 4 8 3 6 12 11 5 10 7 14 15 13 9;
%         1 4 3 12 5 7 15 9 2 8 6 11 10 14 13;
%         1 8 12 10 15 1 8 12 10 15 1 8 12 10 15;
%         1 3 5 15 2 6 10 13 4 12 7 9 8 11 14];
%*************************************************************************

function [Syndrome] = RsDecodeCalcSynd(RsCodeWithNoise)

% 初始化

t=2;
M=4;
n=15;
k=11;

Syndrome = zeros(1,2*t);

% 以下求s1，s2,s3,s4...
for i=1:2*t
    dec = zeros(1,n);
    for j=1:n
        TempPow=mod((j-1)*i,15);
        dec(j)=Alpha2Dec(TempPow);
    end    
    Syndrome(i) = RsPolySum(RsCodeWithNoise,dec);
end