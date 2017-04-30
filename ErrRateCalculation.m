%*************************************************************************
% RS编译码器的仿真程序设计：1501214317 黄腾
%                         pkuht@pku.edu.cn
% 函数名：
%    ErrRateCalculation.m
% 功能：
%    利用已有的RS编解码模块进行信道传输仿真，计算BER和FER
%*************************************************************************

clc;
SNR_in_dB = 0:1:8;
%仿真次数：
N_total = 10^6;
error_max = 100;

k = 11;
n = 15;
BER = zeros(1, length(SNR_in_dB));
FER = zeros(1, length(SNR_in_dB));
SER = zeros(1, length(SNR_in_dB));

for ii = 1:length(SNR_in_dB)
    jj = 1;
    error_bit_sum = 0;
    error_frame_sum = 0;
    error_symbol_sum = 0;
    while (jj < N_total && error_bit_sum < 100) 
        [Msg, RsCode_Tx, sig] = Transmitter(n, k);			%按照发送信息编码
        Noised_sig = awgn(sig, SNR_in_dB(ii) + 10*log10(2));	%过信道
        % EbN0 和 SNR 之间满足 SNR(dB) = EbN0 + 10log10(2)
        Msg_Rx = Receiver(n, k, Noised_sig);
        flag = 0;
        for kk = 1:k
            %计算误符号数
            if Msg(kk) ~= Msg_Rx(kk) 
                flag = 1;
                error_symbol_sum = error_symbol_sum + 1;
            end;

            %计算误比特数
            temp1 = zeros(1, 4);
            temp1(1) = mod(floor((Msg(kk)/2^3)), 2);
            temp1(2) = mod(floor((Msg(kk)/2^2)), 2);
            temp1(3) = mod(floor((Msg(kk)/2^1)), 2);
            temp1(4) = mod(floor((Msg(kk)/2^0)), 2);

            temp2 = zeros(1, 4);
            temp2(1) = mod(floor((Msg_Rx(kk)/2^3)), 2);
            temp2(2) = mod(floor((Msg_Rx(kk)/2^2)), 2);
            temp2(3) = mod(floor((Msg_Rx(kk)/2^1)), 2);
            temp2(4) = mod(floor((Msg_Rx(kk)/2^0)), 2);

            error_bit = abs(temp1 - temp2);
            error_bit_sum = error_bit_sum + sum(error_bit);			
        end;
        %计算误帧数
        if(flag == 1)
            error_frame_sum = error_frame_sum + 1;
        end;
        jj = jj + 1;
    end;
    BER(ii) = error_bit_sum / ((jj-1) * k * 4) + BER(ii);
    SER(ii) = error_symbol_sum / ((jj-1)*k) + SER(ii);
    FER(ii) = error_frame_sum / (jj-1) + FER(ii);
end;
%plot
figure();
semilogy(SNR_in_dB, BER, '.-r', 'linewidth', 2.5);
hold on;
semilogy(SNR_in_dB, SER, '*-b', 'linewidth', 2.5);
semilogy(SNR_in_dB, FER, 'o-g', 'linewidth', 2.5);
hold off;
legend('BER','SER','FER');
grid on;
ylabel('Error Rate','fontsize',12)
xlabel('Eb/N0(dB)','fontsize',12)
save('ber.mat','SNR_in_dB','BER','SER','FER');