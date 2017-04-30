%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSecodeRoot.m
% ���ܣ�
%    ����λ�ö���ʽ�����ģ��
% ���룺
%    ErrorPosPoly������λ�ö���ʽ��1*(2t+1)��ʸ������ά��mΪ�ŵ�����Ĵ��������m<=t��t=2
% ���:
%    Root������λ�ö���ʽ�ĸ���1*m��ʸ��������mΪ�ŵ�����Ĵ��������m<=t��t=2��������ʮ��������ʾ
% �㷨:
%    ��̽�����,��ÿһ��Ԫ����Ϊx������̽,����Ƕ���ʽ�ĸ�,sigma(x)=0
%*************************************************************************

function [RootCalc] = RsDecodeRoot(ErrPosPolyCalc)
%������̽�ķ������
Index1 = [1, 2, 4, 8, 3, 6, 12, 11, 5, 10, 7, 14, 15, 13, 9];
Index2 = [0, 1, 4, 2, 8, 5, 10, 3, 14, 9, 7, 6, 13, 11, 12];
len = length(ErrPosPolyCalc);
RootCalc = [];
flag = 1;
for ii = 1:15  %16�����е���
	result = 0;
	for jj = 1:len
		flag = Index2(ii);
		pointer = mod(flag*(jj-1), 15) + 1;
		temp = RsSymbolMul(ErrPosPolyCalc(jj), Index1(pointer));
		result = RsSymbolAdd(result, temp);
	end;
	if result == 0
		RootCalc = [RootCalc, ii];
	end;
end;
		
	
	
