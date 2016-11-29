function [output] = echolabelling(Unm1,origSound,RIR,q,K,rnm1,rn)
A = Unm1;
T = echocandidates(origSound,RIR,q,K);

B = T;
vn = sqrt(sum((rnm1-rn).^2));
AB = cartesianproduct(A,B);
AB = invalidtrapezoid(AB,vn);
AhB = AB(AB(:,1)>=AB(:,2),:);
AlB = AB(AB(:,1)<=AB(:,2),:);

validpairsAhB = validpairs(AhB,AhB,K);
validpairsAlB = validpairs(AlB,AlB,K);
validjoint = validpairs(validpairsAlB,validpairsAhB,K*2);
output = validjoint;
end