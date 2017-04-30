%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%	 RsPolySum.m
% ���ܣ�������������ʽ��˵Ļ��ĺ�
%	 ��a(i)=x(i)*y(i),�ٽ�a������ϵ�����
% ���룺
%	 LPoly,RPoly�����ȷֱ�len1,len2�Ķ���ʽ
% �����
%	 PolySum����������ʽ��˵Ļ��ĺ�
%*************************************************************************

function [PolySum]=RsPolySum(LPoly,RPoly)

PolySum=0;
len1 = length(LPoly);
len2 = length(RPoly);
len = min(len1,len2);

for i=1:len
    PolySum = RsSymbolAdd(PolySum,RsSymbolMul(LPoly(i),RPoly(i)));
end