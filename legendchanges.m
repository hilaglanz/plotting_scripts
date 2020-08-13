figure('DefaultAxesFontSize',35, 'DefaultLineLineWidth',3);
h = get(gca,'Children');
set(get(get(h(2),'Annotation'),'LegendInformation'),'IconDisplayStyle','off')
set(gca,'Children',[h(3) h(1) h(2)])
plot2dDistance(x5,y5,(x3+x4)/2,(y3+y4)/2,2,1172)
hold on
plot2dDistance(x5,y5,(x3+x3)/2,(y3+y3)/2,1165,1437)
plot2dDistance(x1,y1,x2,y2,2,13200)
axis equal
xlim([-250 250])
ylim([-210 275])