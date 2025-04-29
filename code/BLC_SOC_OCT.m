function BLC_SOC_OCT(data_SOC, data_OCT)
    
    t = table2array(data_SOC(:,1));
    target = table2array(data_SOC(:,2));
    SOC = table2array(data_SOC(:,4:end));
    alleles = table2array(data_OCT(:,3:end));

    [~,n] = size(SOC);
    CB_target = repmat(target,[1,n]);
    diff_soc = SOC - CB_target;
    diff_oct = alleles - target;

    int_SOC = trapz(diff_soc);
    int_OCT = trapz(diff_oct); 

    figure()
    histogram(int_SOC,'BinWidth', 50, 'FaceColor', 'r', 'FaceAlpha', 0.5, 'Normalization', 'count');
    hold on
    histogram(int_OCT,'BinWidth', 50, 'FaceColor', 'b', 'FaceAlpha', 0.5, 'Normalization', 'count');
    hold off;
    xlabel('$\int [C_B (t) - C_{B,\mathrm{target}}(t)] $', 'Interpreter', 'latex','FontSize',15);
    ylabel('Number of alleles')
    legend('SOC', 'Our method','FontWeight','bold', 'FontSize', 18);
    set(gca,'fontweight','bold','fontsize',18);

end