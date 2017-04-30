%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsPolyMul.m
% ���ܣ�
%    GF(2^4)Ԫ�صĶ���ʽ�˷�
% ���룺
%    LPoly,RPoly����������ʽ,���ȷֱ�Ϊlen1��len2
% �����
%    PolyProduct��������õĶ���ʽ,����Ϊlen1+len2-1
%*************************************************************************

function [PolyProduct] = RsPolyMul(LPoly,RPoly)

len1 = length (LPoly);
len2 = length (RPoly);
len = len1 + len2 -1;
PolyProduct = zeros(1,len);

for i=1:len1
    TempPoly = zeros(1,len2);
    for j=1:len2
        TempPoly(j) = RsSymbolMul(LPoly(i),RPoly(j));
    end
    PolyProduct(i:i+len2-1) = RsPolyAdd(PolyProduct(i:i+len2-1),TempPoly);
end