%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsPolyAdd.m
% ���ܣ�
%    GF(2^4)Ԫ�صĶ���ʽ�ӷ���ģ��
% ���룺
%    Poly1,Poly2�����ӵĶ���ʽ,���ȷֱ���len1��len2
% �����
%    Output��������õĶ���ʽ,����Ϊlen1��len2�Ľϴ�ֵ
%*************************************************************************

function [Output] = RsPolyAdd(Poly1,Poly2)

len1 = length(Poly1);
len2 = length(Poly2);
if len1 >= len2
    Output = Poly1;
    len = len2;
else
    Output = Poly2;
    len = len1;
end  

for i=1:len
    Output(i) = RsSymbolAdd(Poly1(i),Poly2(i));
end
