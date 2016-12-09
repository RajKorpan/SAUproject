function [output] = echolabelling(Unm1,origSound,RIR,Fs,K,q,rnm1,rn)
P = Unm1;
T = echocandidates(origSound,RIR,Fs,K,q);
totaljoint = zeros(size(P,1)*size(T,1),8);
l=1;
for i = 1:size(T,1)
    for j = 1:size(P,1)
        A = P(j,:);
        B = T(i,:);
        vn = sqrt(sum((rnm1-rn).^2));
        AB = cartesianproduct(A,B);
        AB = invalidtrapezoid(AB,vn);
        AhB = AB(AB(:,1)>=AB(:,2),:);
        AlB = AB(AB(:,1)<=AB(:,2),:);

        validpairsAhB = validpairs(AhB,AhB,K);
        validpairsAlB = validpairs(AlB,AlB,K);
        validjoint = validpairs(validpairsAlB,validpairsAhB,K*2);
        if ~isempty(validjoint)
            for k = 1:size(validjoint,1)
                totaljoint(l,:) = validjoint(k,:);
                l = l+1;
            end
        end
    end
end
totaljoint = totaljoint(totaljoint(:,1)>0,:);
output = totaljoint;
end