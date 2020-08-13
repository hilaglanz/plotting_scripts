function [] = plotForce(t1,t2,innerMassFile,tripleDistanceFile,innerDistanceFile,min,max)
G = 6.674*10^-8;
MSun = (1.989*10^33);
RSun = 69643000000;
m = 1 * MSun;
innerMass = GetOnlyValues(innerMassFile).*MSun;
tripleDistance = GetOnlyValues(tripleDistanceFile).*RSun;
innerDistance = GetOnlyValues(innerDistanceFile).*RSun;

F = -G.*(2*innerMass(min:max).*m./tripleDistance(min:max).^2 );
ForceWithoutHoles = zeros(1,length(F));
j = 1;
for i=1:max-min
    if innerMass(i) ~= -1
        ForceWithoutHoles(j) = F(i);
        j = j+1;
    end        
end
plot(linspace(t1,t2,j-1),ForceWithoutHoles(1:j-1));
end

function [values]=GetOnlyValues(file)
fid = fopen(file);
scanedData = textscan(fid, '%f %s');
values = scanedData{1};
fclose(fid);
end