%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    Transmitter.m
% ���ܣ�
%    �������е�RS�����ģ������ŵ�������棬ʵ�ַ��������
%*************************************************************************

function [Source, RsCode_Tx, Data_bpsk_Tx] = Transmitter(n, k)
Source = floor(k*rand(1, k));
RsCode_Tx = RsEncode(Source);
%����BPSK����(0��Ӧ1�� 1��Ӧ-1)
Data_bpsk_Tx = zeros(1, 4*n);

for ii = 1:n
	temp(1) = mod(floor((RsCode_Tx(ii)/2^3)), 2);
	temp(2) = mod(floor((RsCode_Tx(ii)/2^2)), 2);
	temp(3) = mod(floor((RsCode_Tx(ii)/2^1)), 2);
	temp(4) = mod(floor((RsCode_Tx(ii)/2^0)), 2);
	Data_bpsk_Tx((ii-1)*4+1: (ii*4)) = 1 - 2*temp;
end;