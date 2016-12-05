function [output] = robotposition(vnm1,priortheta)
xrange = [-6:0.1:6];
yrange = [-6:0.1:6];
[Xrange,Yrange] = meshgrid(xrange,yrange);
priormu = priortheta(1,:);
sigma = priortheta(2:3,:);
prior = mvnpdf([Xrange(:) Yrange(:)],priormu,sigma);
prior = reshape(prior,length(Yrange),length(Xrange));

xchange = vnm1(1);
ychange = vnm1(2);
posterior = prior;
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
[a,b]=find(posterior==max(max(posterior)));
output = posterior;
end