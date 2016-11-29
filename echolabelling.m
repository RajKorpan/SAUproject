function [output] = echolabelling(Unm1,Un,rnm1,rn)
A = Unm1;
B = Un;
vn = sqrt(sum((rnm1-rn).^2));
AB = cartesianproduct(A,B);
AB = invalidtrapezoid(AB,vn);
AhB = AB(AB(:,1)>=AB(:,2),:);
AlB = AB(AB(:,1)<=AB(:,2),:);

validpairsAhB = validpairs(AhB,AhB,4);
validpairsAlB = validpairs(AlB,AlB,4);
validjoint = validpairs(validpairsAlB,validpairsAhB,8);
output = validjoint;
end