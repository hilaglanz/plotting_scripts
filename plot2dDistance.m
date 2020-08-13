function [r] = plot2dDistance(x1,y1,x2,y2,firstIndex,lastIndex)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
plot((x2(firstIndex:lastIndex)-x1(firstIndex:lastIndex))*(1.4367816091954*10^(-11)),(y2(firstIndex:lastIndex)-y1(firstIndex:lastIndex))*(1.4367816091954*10^(-11)),'LineWidth',3);
r =(((x2(lastIndex)-x1(lastIndex))^2 + (y2(lastIndex)-y1(lastIndex))^2)^0.5)*(1.4367816091954*10^(-11));
end

