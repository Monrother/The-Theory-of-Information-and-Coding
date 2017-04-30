%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsEncode.m
% 功能：
%	 RS编码模块
% 输入：
%    Msg:输入信息序列，为1*k的矢量
% 输出：
%    RsCode:参数为(15,11)的RS编码输出，为1*n矢量
% 算法描述：
%    RsCode的高k位为信息序列，低n-k位为(U(x)*2^(2t))mod g(x)
%    即实现(U(x)*2^(2t))/g(x)
%*************************************************************************

function [RsCode] = RsEncode(Msg) 

n = 15;    % 码长
k = 11;    % 信息序列长度
t = 2;     % 最大纠错个数
M = 4;     % GF(2^4)

gx = [7,8,12,13];        % 生成多项式 g(x)=x^4+13x^3+12x^2+8x+7,省去最高位
RsCode = zeros(1,n);
RsCode(n-k+1:n) = Msg;   % 系统码，高k位为信息序列
TempRsCode = RsCode;     
tempgx = zeros(1,2*t);   % 记录g(x)与商的每一位相乘的结果
Residual = zeros(1,2*t);      % 余数

for i=n:-1:n-k+1
    temp = TempRsCode(i);  % 记录商的每一位
    tempgx = RsPolyMul(temp,gx);
    Residual = TempRsCode (i-2*t:i-1);
    Residual = RsPolySub(Residual,tempgx);
    TempRsCode(i-2*t:i-1) = Residual;
end

RsCode(1:2*t) = Residual;