%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    Transmitter.m
% 功能：
%    利用已有的RS编解码模块进行信道传输仿真，实现发射机功能
%*************************************************************************

function [Source, RsCode_Tx, Data_bpsk_Tx] = Transmitter(n, k)
Source = floor(k*rand(1, k));
RsCode_Tx = RsEncode(Source);
%进行BPSK调制(0对应1， 1对应-1)
Data_bpsk_Tx = zeros(1, 4*n);

for ii = 1:n
	temp(1) = mod(floor((RsCode_Tx(ii)/2^3)), 2);
	temp(2) = mod(floor((RsCode_Tx(ii)/2^2)), 2);
	temp(3) = mod(floor((RsCode_Tx(ii)/2^1)), 2);
	temp(4) = mod(floor((RsCode_Tx(ii)/2^0)), 2);
	Data_bpsk_Tx((ii-1)*4+1: (ii*4)) = 1 - 2*temp;
end;