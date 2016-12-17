function [output] = bayesfilter(TOAs,rnm1,rn,wallsprior,c)
% Function that computes the tangent lines, then the wall parameters
% distributions

counts = ones(size(wallsprior));
prior = wallsprior;

for i = 1:length(TOAs)
    tl = tangentlinecombo(rnm1,rn,TOAs(i,:)*c/2);
    if ~isempty(tl)
        for j = 1:length(tl)
            if validlines(tl(j,:),rnm1,rn) == 1
                line = round(tl(j,:));
                loc1 = line(1,[1,3,5,7])+15001;
                loc2 = line(1,[2,4,6,8])+15001;
                counts(loc1(1),1) = counts(loc1(1),1) +1;
                counts(loc1(2),3) = counts(loc1(2),3) +1;
                counts(loc1(3),5) = counts(loc1(3),5) +1;
                counts(loc1(4),7) = counts(loc1(4),7) +1;
                counts(loc2(1),2) = counts(loc2(1),2) +1;
                counts(loc2(2),4) = counts(loc2(2),4) +1;
                counts(loc2(3),6) = counts(loc2(3),6) +1;
                counts(loc2(4),8) = counts(loc2(4),8) +1;
            end
        end
    end
end
posterior = [counts(:,1)/sum(counts(:,1)),counts(:,2)/sum(counts(:,2)),counts(:,3)/sum(counts(:,3)),counts(:,4)/sum(counts(:,4)),counts(:,5)/sum(counts(:,5)),counts(:,6)/sum(counts(:,6)),counts(:,7)/sum(counts(:,7)),counts(:,8)/sum(counts(:,8))].*prior;
posterior = [posterior(:,1)/sum(posterior(:,1)),posterior(:,2)/sum(posterior(:,2)),posterior(:,3)/sum(posterior(:,3)),posterior(:,4)/sum(posterior(:,4)),posterior(:,5)/sum(posterior(:,5)),posterior(:,6)/sum(posterior(:,6)),posterior(:,7)/sum(posterior(:,7)),posterior(:,8)/sum(posterior(:,8))];
output = posterior;
end