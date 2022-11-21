clear;
% clc;
close all;

%% Set Parameters for Loading Data
fig=figure;
set(fig,'DefaultAxesFontSize',20);
set(fig,'DefaultAxesFontWeight','bold');

data_root = '';
color_list = linspecer(3);
BW=125000;
SF=7;

SNR_list=[-25:15];
nelora_file='evaluation/sf7_v1_';

SNR_list2=[-25:15];
nelora_file2='evaluation/sf7_v1_7_125000_0.3_0.15.mat';

SNR_list_baseline=-30:0;
baseline_file='evaluation/baseline_error_matrix_';

name_str1=[nelora_file,num2str(SF),'_',num2str(BW),'.mat'];
error_path1 = [data_root,name_str1];
a1 = load(error_path1);
error_matrix1 = a1.error_matrix;
% error_matrix_info = a.error_matrix_info;

plot(SNR_list,1-error_matrix1,"-.*",'LineWidth',3,'color',color_list(1,:));
hold on;

name_str3=nelora_file2;
error_path3 = [data_root,name_str3];
a3 = load(error_path3);
error_matrix3 = a3.error_matrix;
% error_matrix_info = a.error_matrix_info;

plot(SNR_list2,1-error_matrix3,"-.*",'LineWidth',3,'color',color_list(3,:));
hold on;

name_str2=[baseline_file,num2str(SF),'_',num2str(BW),'.mat'];
error_path2 = [data_root,name_str2];
a2 = load(error_path2);
error_matrix2 = a2.error_matrix;
plot(SNR_list_baseline,1-error_matrix2,"-.*",'LineWidth',2,'color',color_list(2,:));
hold on;

legend('abs baseline', 'our baseline', 'phs baseline')

% legend('abs_baselineNELoRa','Baseline')
xlabel('SNR (dB)'); % x label
ylabel('SER'); % y label
title('Decode SER for SF=7')
xlim([-30,0]);
set(gcf,'WindowStyle','normal','Position', [200,200,640,360]);
saveas(gcf,[data_root,'res/',num2str(SF),'_',num2str(BW),'.png'])
