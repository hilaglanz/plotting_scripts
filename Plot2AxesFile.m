function [p] = Plot2AxesFile(xAxisFile,yAxisFile,additionalY,maxX)
fid = fopen(xAxisFile);
values = textscan(fid, '%f %s');
xAxisData=values{1};
fclose(fid);
fid = fopen(yAxisFile);
values = textscan(fid, '%f %s %s %s');
yAxisData=values{1};
fclose(fid);
if  length(yAxisData) ~= length(xAxisData)
    fid = fopen(yAxisFile);
    values = textscan(fid, '%f %s');
    yAxisData=values{1};
    yAxisData = yAxisData./696430000;
    fclose(fid);
else
    if values{4}{1} == "kg,"
        yAxisData=yAxisData.*1000;
    end
    if values{2}{1} == "m**-3"
        yAxisData=yAxisData./(100^3);
    end
end
if length(yAxisData) ~= length(xAxisData)
    fid = fopen(yAxisFile);
    values = textscan(fid, '%f %s %s');
    yAxisData=values{1};
    fclose(fid);
end

l=length(xAxisData);
l=250000;
for i=1:l
    if xAxisData(i)<maxX
        yAxisData(i)= yAxisData(i)+additionalY;
    else
        break;
    end
end
pd1 = fitdist(yAxisData,'kernel','BandWidth',0.02);
x = logspace(0,2);
cd1=cdf(pd1,x);
%plot(x,cd1);
%histogram(yAxisData,'Normalization','cdf');
%hold on
%histogram(yAxisData,'Normalization','probability');
ytix = get(gca, 'YTick');
set(gca, 'YTick',ytix, 'YTickLabel',ytix*100);
p = loglog(xAxisData(1:l),yAxisData(1:l));
end
