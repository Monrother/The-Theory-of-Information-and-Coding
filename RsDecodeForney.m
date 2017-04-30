%*************************************************************************
% RS���������ķ��������ƣ�1501214317 ����
%                         pkuht@pku.edu.cn
% ��������
%    RsSecodeForney.m
% ���ܣ�
%    ����λ�ö���ʽ������ģʽ
% ���룺
%    SyndromCalc:�������ʽ��Ϊ1*2t(t=2)��ʸ��
%    ErrorPosPolyCalc������λ�ö���ʽ��1*(2t+2)��ʸ������ά��mΪ�ŵ�����Ĵ��������m<=t��t=2
%    RootCalc:����λ��,1*m��ʸ��,��ά��mΪ�ŵ�����Ĵ��������m<=t��t=2
% ���: 
%    ErrorPositionCalc������λ��ʸ����1*m��ʸ��������mΪ�ŵ�����Ĵ��������m<=t��t=2,��alphaֵ��ʾ
%    ErrorValueCalc��������ֵʸ����1*m��ʸ��������mΪ�ŵ�����Ĵ��������m<=t��t=2
%*************************************************************************

function [ErrorValueCalc, ErrorPositionCalc] = RsDecodeForney(SyndromCalc, ErrPosPolyCalc, RootCalc);
Index1 = [1, 2, 4, 8, 3, 6, 12, 11, 5, 10, 7, 14, 15, 13, 9];
Index2 = [0, 1, 4, 2, 8, 5, 10, 3, 14, 9, 7, 6, 13, 11, 12];
t=2;
len1 = length(RootCalc);
ErrorPositionCalc = zeros(1, len1);
ErrorValueCalc = zeros(1, len1);
%�������λ��
ErrorRootVal = [];
for ii = 1:len1
	temp = RsSymbolRev(RootCalc(ii));
	ErrorRootVal = [ErrorRootVal, temp];
	ErrorPositionCalc(ii) = Index2(temp);
end;
%��������
ErrorPositionCalc = sort(ErrorPositionCalc);

%���������ֵ
W = RsPolyMul(SyndromCalc, ErrPosPolyCalc);
W = W(1:2*t);
len2 = length(ErrPosPolyCalc);
DeltaErrPosPolyCalc = ErrPosPolyCalc(2:len2);
ErrPosPolyCalc;
for ii = 2:len2
	if(mod(ii-1, 2) == 0)
		DeltaErrPosPolyCalc(ii-1) = 0;
	else
		DeltaErrPosPolyCalc(ii-1) = ErrPosPolyCalc(ii);
	end;
end;
len3 = length(DeltaErrPosPolyCalc);
len4 = length(W);
ErrorValueCalc = zeros(1, len1);
for ii = 1:len1
	temp_w = 0;
	temp_Delta = 0;
	for jj = 1:len3
		flag = Index2(ErrorRootVal(ii));
		pointer = mod(flag*(jj-1), 15)+1;
		temp_Delta = RsSymbolAdd(temp_Delta, RsSymbolMul(DeltaErrPosPolyCalc(jj), Index1(pointer)));
	end;
	for jj = 1:len4
		flag = Index2(ErrorRootVal(ii));
		pointer = mod(flag*(jj-1), 15)+1;
		temp_w = RsSymbolAdd(temp_w, RsSymbolMul(W(jj), Index1(pointer)));
	end;
	if(temp_Delta ==0)%���û�г�����ErrorValueCalc = 0
		ErrorValue(ii) = 0;
	else
		ErrorValueCalc(ii) = RsSymbolDiv(temp_w, temp_Delta);
	end;
end;

