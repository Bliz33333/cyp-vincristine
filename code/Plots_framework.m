clear all
close all
clc

%% Figure 1
% t rows and n columns (each column different allele) (t,target Cb(t), Each Allele Cb(t))    

data_SOC = readtable('data_SOC.csv');
data_OCT = readtable('data_OCT.csv');
BLC_SOC_OCT(data_SOC, data_OCT)

%% Figure 2
% Slow, Average, Fast Allele comparison
% t rows and 4 columns (t,slow, average, fast)

data = table2array(readtable('metabolizer_profiles.csv'));
allel_comp(data)

%%
data_oct = table2array(data_OCT);
data_soc = table2array(data_SOC);
t = data_oct(:,1);


%%
a_soc = data_SOC.Properties.VariableNames;
a_oct = data_OCT.Properties.VariableNames;


for i = 4:30
    figure()
    plot(t,data(:,3),'g','LineWidth',3)
    hold on
    plot(t, data_soc(:,i),'b','LineWidth',3)
    hold on
    plot(t, data_oct(:,i-1),'r','LineWidth',3)
    xlim([0 500])
    disp(a_soc(i))
    disp(a_oct(i-1))
    legend('Target','SOC','OCT')
    title([a_soc(i)])
    hold on

end

%%
% Slow
figure()
plot(t,data(:,3),"-.",'Color','#4DBEEE',LineWidth=3)
hold on
plot(t,data_soc(:,12),'Color','#7E2F8E','LineWidth',3)
hold on
plot(t(2:end),data_oct(2:end,11),'Color','#ea9999','LineWidth',3)
xlim([0 500])
xlabel('Time (minutes)')
ylabel('Blood Level Concentration (mg/L)')
legend('Target','SOC schedule','OCT schedule','FontWeight','bold', 'FontSize', 18);
title('Slow Metabolizer')
set(gca,'fontweight','bold','fontsize',18);


%% Fast
figure()
plot(t,data(:,3),"-.",'Color','#4DBEEE',LineWidth=3)
hold on
plot(t,data_soc(:,26),'Color','#7E2F8E','LineWidth',3)
hold on
plot(t(2:end),data_oct(2:end,25),'Color','#ea9999','LineWidth',3)
xlim([0 500])
xlabel('Time (minutes)')
ylabel('Blood Level Concentration (mg/L)')
legend('Target','SOC schedule','OCT schedule','FontWeight','bold', 'FontSize', 18);
title('Fast Metabolizer')
set(gca,'fontweight','bold','fontsize',18);


