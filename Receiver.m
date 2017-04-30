%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    Receiver.m
% 功能：
%    利用已有的RS编解码模块进行信道传输仿真，实现接收机
%*************************************************************************

function [Source_Received] =  Receiver(n, k, Noised_sig)
%判决
Sig_judged = 2*(Noised_sig > 0)-1;
%解调
Sig_judged = (1-Sig_judged)/2;
RsCode_Rx = zeros(1, n);
for ii = 1:n
	temp = Sig_judged((ii-1)*4+1:ii*4);
	RsCode_Rx(ii) = 2^3*temp(1) + 2^2*temp(2) + 2*temp(3) + temp(4);
end;

%RS解码
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
%取出信息位
Source_Received = Source_Received(n - k + 1:n);


