function [outputArg1,outputArg2] = radial_profiler(radiusFile,densityFile,soundSpeedFile, temperatureFile, energyFile, pressureFile)
fidr = fopen(radiusFile);
r = textscan(fidr,'%f %s');
radius = r{1};
fidRho= fopen(densityFile);
d = textscan(fidRho,'%f %s %s %s');
rho=d{1};
fidCs= fopen(soundSpeedFile);
c = textscan(fidCs,'%f %s %s %s');
cs = c{1};
cs=cs.*(100);%conversion to cgs
fidT= fopen(temperatureFile);
temp = textscan(fidT,'%f %s %s %s');
T = temp{1};
fclose(fiT);
fidU= fopen(energyFile);
us = textscan(fidU,'%f %s %s %s');
U = us{1}.*(100^2);
fclose(fidU);
P1=rho.*(1.38*10^-16).*T./1.25;
U1=1.5.*P1./rho;
fidP= fopen(pressureFile);
ps = textscan(fidP,'%f %f %s %s %s %s %s %s');
P = ps{1}.*10000;
fclose(fidP);
figure('DefaultAxesFontSize',20, 'DefaultLineLineWidth',3);
subplot(2,2,1);
%for i=1:length(radius)
%    if radius(i)<0.1
%        rho(i)=rho(i)+1.03*(1.989*10^33)/(4*pi*((0.1*69643000000)^3)/3);
%    end
%end
loglog(radius,rho);
xlim([10^-2 1.5*10^2]);
xlabel("Radius [R_{Sun}]");
ylabel("Density [g/{cm}^3]");
subplot(2,2,2);
loglog(radius,P);
xlim([10^-2 1.5*10^2]);
xlabel("Radius [R_{Sun}]");
ylabel("Pressure [{erg}/{cm}^3]");
subplot(2,2,3);
loglog(radius,cs./100000);
xlabel("Radius [R_{Sun}]");
ylabel("Sound Speed [{cm}^2/s]");
xlim([10^-2 1.5*10^2]);
subplot(2,2,4);
loglog(radius,U);
xlim([10^-2 1.5*10^2]);
xlabel("Radius [R_{Sun}]");
ylabel("Specific Internal Energy [{erg}/g]");
end

