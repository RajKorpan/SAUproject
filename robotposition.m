function [output] = robotposition(vnm1,priortheta,xrange,yrange)
% Bayes Updating function that computes the distribution of the robot
% position based on the velocity and prior

[Xrange,Yrange] = meshgrid(xrange,yrange);
priormu = priortheta(1,:);
priorsigma = priortheta(2:3,:);
if isequal(priorsigma,[0,0;0,0])
    prior = zeros(length(yrange),length(xrange));
    prior(round(length(yrange)/2),round(length(xrange)/2)) = 1;
    sigma = [0.2,0;0,0.2];
else
    sigma = priorsigma;
    prior = mvnpdf([Xrange(:) Yrange(:)],priormu,sigma);
    prior = reshape(prior,length(yrange),length(xrange));
end

xchange = vnm1(1);
ychange = vnm1(2);
ml=0*prior;
for i = 1:length(yrange)
    for j = 1:length(xrange)
        mu = [xrange(j)+xchange,yrange(i)+ychange];
        likelihood = mvnpdf([Xrange(:) Yrange(:)],mu,sigma) * prior(i,j);
        likelihood = reshape(likelihood,length(yrange),length(xrange));
        ml = ml + likelihood;
    end
end
posterior=ml/sum(sum(ml));
%[a,b]=find(posterior==max(max(posterior)));
output = posterior;
end