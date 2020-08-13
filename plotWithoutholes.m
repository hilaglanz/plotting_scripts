function [p] = plotWithoutholes(yAxisFile,min,max,cut,cutleft)
%figure('DefaultAxesFontSize',20, 'DefaultLineLineWidth',3);
fid = fopen(yAxisFile);
values = textscan(fid, '%f %s');
fclose(fid);
yAxisData=values{1};
v = zeros(1,cut-cutleft);
j = 1;
for i=1:cut-cutleft
    if yAxisData(i+cutleft) ~= -1
        v(j) = yAxisData(i+cutleft);
        j = j + 1;
    end
end
%p = plot(linspace(min,max,j-1),-smoothdata(v(1:j-1),'lowess',6).*(10^9));
%p = plot(linspace(min,max,j-1),-(v(1:j-1)).*(10^9));
%plot(linspace(min,max,j-1),smoothdata(v(1:j-1),'lowess',10).*(10^16),'linewidth',7);
plot(linspace(min,max,j-1),v(1:j-1).*(10^16),'linewidth',5);
%plot(linspace(min,max,j-1),v(1:j-1));
%plot(linspace(min,max,j-1),v(1:j-1)./(1.989*10^33/69643000000^3));
%p=v(1:j-1).*(10^13);
end

