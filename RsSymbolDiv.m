%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSymbolDiv.m
% ���ܣ�
%    GF(2^4)Ԫ�صĳ�����ģ��
% ���룺
%    LOperand: ��������ʮ���Ʊ�ʾ
%    ROperand��������ʮ���Ʊ�ʾ
% �����
%    Quotient��Ԫ�����֮�̣�ʮ���Ʊ�ʾ
%*************************************************************************

function [Quotient] = RsSymbolDiv(LOperand,ROperand)

M = 4; % GF(2^4)

if LOperand == 0
    Quotient = 0;
    return;
elseif ROperand == 0
    Quotient = inf;
    return;
end  

LOperand_alpha = Dec2Alpha(LOperand);
ROperand_alpha = Dec2Alpha(ROperand);
alpha = mod (LOperand_alpha - ROperand_alpha, 2^M-1);
Quotient = Alpha2Dec(alpha);