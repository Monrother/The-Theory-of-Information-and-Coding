%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    RsSymbolRev.m
% 功能：
%    GF(2^4)元素的求反子模块
% 输入：
%    Operand: 待求反的元素，十进制表示
% 输出：
%    Rev：元素求反的结果，十进制表示
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


