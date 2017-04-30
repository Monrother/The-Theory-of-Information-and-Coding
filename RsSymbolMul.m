%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSymbolMul.m
% ���ܣ�
%    GF(2^4)Ԫ�صĳ˷���ģ��
% ���룺
%    LOperand,ROperand�����˵�Ԫ�أ���Ϊʮ���Ʊ�ʾ
% �����
%    Product��Ԫ��֮�ͣ�ʮ���Ʊ�ʾ
%*************************************************************************

function [Product] = RsSymbolMul(LOperand,ROperand)

M = 4; % GF(2^4)
if LOperand*ROperand == 0
    Product = 0;
else
    LOperand_alpha = Dec2Alpha(LOperand);
    ROperand_alpha = Dec2Alpha(ROperand);
    alpha = mod (LOperand_alpha + ROperand_alpha, 2^M-1);
    Product = Alpha2Dec(alpha);
end