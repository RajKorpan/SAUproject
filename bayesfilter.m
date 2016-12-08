function [output] = bayesfilter(TOAs,rnm1,rn,sloperange,interceptrange,walls,tangentlineprior)
%[Sloperange,Interceptrange,Walls] = meshgrid(sloperange,interceptrange,walls);
counts = ones(length(sloperange),length(interceptrange),length(walls));
prior = tangentlineprior; 
for i = 1:length(TOAs)
    tl = tangentlinecombo(rnm1,rn,TOAs(i,:));
    if ~isempty(tl)
        for j = 1:length(tl)
            if validlines(tl(j,:),rnm1,rn) == 1
                line = tl(j,:);
                slopeind = discretize(line(:,[1,3,5,7]),sloperange,'IncludedEdge','right');
                interceptind = discretize(line(:,[2,4,6,8]),interceptrange,'IncludedEdge','right');
                for k = 1:4
                    counts(slopeind(k),interceptind(k),walls(k)) = counts(slopeind(k),interceptind(k),walls(k))+1;
                end
            end
        end
    end
end
posterior=counts/sum(sum(sum(counts))) .* prior;
posterior=posterior/sum(sum(sum(posterior)));
output = posterior;
end

