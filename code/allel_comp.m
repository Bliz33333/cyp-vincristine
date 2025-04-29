function allel_comp(data)

    t = data(:,1);
    slow = data(:,2);
    avg = data(:,3);
    fast = data(:,4);

    figure()
    plot(t,slow,'r','LineWidth',3)
    hold on
    plot(t,avg,'#93c47d','LineWidth',3)
    hold on
    plot(t,fast,'#e06666','LineWidth',3)
    xlim([0 500])
    xlabel('Time (minutes)')
    ylabel('Blood Level Concentration (mg/L)')
    legend('Slow metabolizer','Average metabolizer','Fast metabolizer','FontWeight','bold', 'FontSize', 18);
    set(gca,'fontweight','bold','fontsize',18);
    
end