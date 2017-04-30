%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsEncode.m
% ���ܣ�
%	 RS����ģ��
% ���룺
%    Msg:������Ϣ���У�Ϊ1*k��ʸ��
% �����
%    RsCode:����Ϊ(15,11)��RS���������Ϊ1*nʸ��
% �㷨������
%    RsCode�ĸ�kλΪ��Ϣ���У���n-kλΪ(U(x)*2^(2t))mod g(x)
%    ��ʵ��(U(x)*2^(2t))/g(x)
%*************************************************************************

function [RsCode] = RsEncode(Msg) 

n = 15;    % �볤
k = 11;    % ��Ϣ���г���
t = 2;     % ���������
M = 4;     % GF(2^4)

gx = [7,8,12,13];        % ���ɶ���ʽ g(x)=x^4+13x^3+12x^2+8x+7,ʡȥ���λ
RsCode = zeros(1,n);
RsCode(n-k+1:n) = Msg;   % ϵͳ�룬��kλΪ��Ϣ����
TempRsCode = RsCode;     
tempgx = zeros(1,2*t);   % ��¼g(x)���̵�ÿһλ��˵Ľ��
Residual = zeros(1,2*t);      % ����

for i=n:-1:n-k+1
    temp = TempRsCode(i);  % ��¼�̵�ÿһλ
    tempgx = RsPolyMul(temp,gx);
    Residual = TempRsCode (i-2*t:i-1);
    Residual = RsPolySub(Residual,tempgx);
    TempRsCode(i-2*t:i-1) = Residual;
end

RsCode(1:2*t) = Residual;