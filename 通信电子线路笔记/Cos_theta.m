clc; clear; close all;

%% ========== 参数 ==========
Uon  = 0.7;      % 导通电压
Usat = 0.9;      % 转移特性中进入饱和对应的输入电压
k    = 100;      % 转移特性斜率，mA/V

beta    = 50;                     % 电流放大倍数
Uces    = 0.5;                    % 饱和压降
IB_list = [0 0.02 0.04 0.06 0.08]; % 基极电流，单位 mA

%% ========== (a) 转移特性 ==========
uBE = linspace(0, 1.2, 1000);
ICmax = k * (Usat - Uon);
iC_transfer = zeros(size(uBE));

for n = 1:length(uBE)
    if uBE(n) < Uon
        iC_transfer(n) = 0;
    elseif uBE(n) <= Usat
        iC_transfer(n) = k * (uBE(n) - Uon);
    else
        iC_transfer(n) = ICmax;
    end
end

figure(1);
plot(uBE, iC_transfer, 'LineWidth', 2);
grid on;
xlabel('u_{BE} / V');
ylabel('i_C / mA');
title('转移特性');
xlim([0 1.2]);
ylim([0 ICmax*1.2]);

hold on;
plot([Uon Uon], [0 ICmax*1.2], '--');
plot([Usat Usat], [0 ICmax*1.2], '--');
text(Uon+0.02, ICmax*0.12, 'U_{on}');
text(Usat+0.02, ICmax*0.12, 'U_{sat}');
hold off;




%% ========== (b) 输出特性 ==========
uCE = linspace(0, 10, 500);

figure(2);
hold on;
grid on;

for IB = IB_list
    IC0 = beta * IB;
    iC_output = IC0 * ones(size(uCE));
    
    idx = uCE < Uces;
    iC_output(idx) = IC0/Uces .* uCE(idx);
    
    plot(uCE, iC_output, 'LineWidth', 2);
end

xlabel('u_{CE} / V');
ylabel('i_C / mA');
title('输出特性');
xlim([0 10]);
ylim([0 beta*max(IB_list)*1.2]);

legend('i_B=0', 'i_B=0.02 mA', 'i_B=0.04 mA', ...
       'i_B=0.06 mA', 'i_B=0.08 mA', ...
       'Location', 'southeast');
hold off;
