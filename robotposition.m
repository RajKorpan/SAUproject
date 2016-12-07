function [output] = robotposition(vnm1,priortheta,xrange,yrange)
[Xrange,Yrange] = meshgrid(xrange,yrange);
priormu = priortheta(1,:);
priorsigma = priortheta(2:3,:);
if isequal(priorsigma,[0,0;0,0])
    prior = zeros(length(xrange),length(yrange));
    prior(round(length(xrange)/2),round(length(yrange)/2)) = 1;
    sigma = [1,0;0,1];
else
    sigma = priorsigma;
    prior = mvnpdf([Xrange(:) Yrange(:)],priormu,sigma);
    prior = reshape(prior,length(Yrange),length(Xrange));
end

xchange = vnm1(1);
ychange = vnm1(2);
ml=0*prior;
for i = 1:length(prior)
    for j = 1:length(prior)
        mu = [xrange(i)+xchange,yrange(j)+ychange];
        likelihood = mvnpdf([Xrange(:) Yrange(:)],mu,sigma) * prior(i,j);
        likelihood = reshape(likelihood,length(Yrange),length(Xrange));
        ml = ml + likelihood;
    end
end
posterior=ml/sum(sum(ml));
%[a,b]=find(posterior==max(max(posterior)));
output = posterior;
end