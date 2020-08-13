function [plot] = Plot1AxesFile( yAxisFile, yAxisLabel, minIndex, maxIndex, title, timeShift, timeStep, skipStep )
if nargin<7
    timeStep=0.2;
end
if nargin<8
    skipStep=1;
end

fid = fopen(yAxisFile);
values = textscan(fid, '%f %s');
yAxisData=values{1};
yAxisLabel = strcat(yAxisLabel,' [',strrep(values{2}{1},',',''),']');
plot = Plot1Axes(yAxisData,yAxisLabel, minIndex, maxIndex, title, timeShift, timeStep, skipStep);
fclose(fid);
end

function [plot] = Plot1Axes( yAxisData, yAxisLabel, minIndex, maxIndex, title,timeShift, timeStep, skipStep )
plot = Plot(linspace(timeShift+(minIndex-1)*timeStep,timeShift+(maxIndex-1)*timeStep,floor((maxIndex-minIndex)/skipStep)),'time [days]',yAxisData(minIndex:skipStep:maxIndex), yAxisLabel, 1, floor((maxIndex-minIndex)/skipStep), title);
end

function [ timePlot ] = Plot( xAxisData, xAxisLabel, yAxisData, yAxisLabel, minIndex, maxIndex, plotTitle )
minIndex
maxIndex
xAxisData(minIndex)
xAxisData(maxIndex)
yAxisData(maxIndex)
timePlot = plot(xAxisData(minIndex:maxIndex),yAxisData(minIndex:maxIndex), 'linewidth', 3.0);
%timePlot = plot(xAxisData(minIndex:maxIndex),yAxisData(minIndex:maxIndex)./(1.989*10^33/69643000000^3), 'linewidth', 3.0);
%title(plotTitle + num2str(yAxisData(maxIndex)));
%xlabel(xAxisLabel);
%ylabel(yAxisLabel);
hold on;
end

