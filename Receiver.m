%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    Receiver.m
% ���ܣ�
%    �������е�RS�����ģ������ŵ�������棬ʵ�ֽ��ջ�
%*************************************************************************

function [Source_Received] =  Receiver(n, k, Noised_sig)
%�о�
Sig_judged = 2*(Noised_sig > 0)-1;
%���
Sig_judged = (1-Sig_judged)/2;
RsCode_Rx = zeros(1, n);
for ii = 1:n
	temp = Sig_judged((ii-1)*4+1:ii*4);
	RsCode_Rx(ii) = 2^3*temp(1) + 2^2*temp(2) + 2*temp(3) + temp(4);
end;

%RS����
SyndromCalc = RsDecodeCalcSynd(RsCode_Rx);
[ErrPosPolyCalc, SigmaCalc] = RsDecodeIterate(SyndromCalc);
RootCalc = RsDecodeRoot(ErrPosPolyCalc);
[ErrorValueCalc, ErrorPositionCalc] = RsDecodeForney(SyndromCalc, ErrPosPolyCalc, RootCalc);
error = zeros(1, n);
for ii = 1:length(ErrorPositionCalc)
	error(ErrorPositionCalc(ii)+1) = ErrorValueCalc(ii);
end;
Source_Received = zeros(1, n);
for ii = 1:n
	Source_Received(ii) = RsSymbolSub(RsCode_Rx(ii), error(ii));
end;
%ȡ����Ϣλ
Source_Received = Source_Received(n - k + 1:n);


