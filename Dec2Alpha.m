%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%     Dec2Alpha.m
% 功能：
%     通过查表的方法，将十进制表示的元素，转换为alpha幂次表示
% 输入：
%     dec，十进制表示的元素
% 输出：
%     AlphaIndex表示alpha的幂次
%*************************************************************************

function [AlphaIndex]=Dec2Alpha(dec)

array2 = [0,1,4,2,8,5,10,3,14,9,7,6,13,11,12];

% 输入检查
if dec <=0 || dec>15
    disp('Wrong input. Please try again.');
end

AlphaIndex =array2 (dec);