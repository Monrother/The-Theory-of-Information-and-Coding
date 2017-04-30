%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSymbolRev.m
% ���ܣ�
%    GF(2^4)Ԫ�ص�����ģ��
% ���룺
%    Operand: ���󷴵�Ԫ�أ�ʮ���Ʊ�ʾ
% �����
%    Rev��Ԫ���󷴵Ľ����ʮ���Ʊ�ʾ
%*************************************************************************

function [Rev] = RsSymbolRev(Operand)

M = 4; % GF(2^4)

if Operand == 0
    Rev = 0;
else
    Operand_alpha = Dec2Alpha(Operand);
    alpha = 2^M-1-Operand_alpha;
    if alpha == 15
        Rev = 1;
    else
        Rev = Alpha2Dec(alpha);
    end
end  


