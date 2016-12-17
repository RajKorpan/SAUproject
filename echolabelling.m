function [output] = echolabelling(EchoCandidates1,EchoCandidates2,K,rnm1,rn,wallordering)
% Function that matches the echoes from the previous position to the
% current position and then orders the echoes according to the wall
% ordering

P = EchoCandidates1;
T = EchoCandidates2;
totaljoint = {};
vn = sqrt(sum((rnm1-rn).^2));
velocity = rnm1-rn;
if abs(velocity(1)) > abs(velocity(2)) && velocity(1) > 0 && velocity(2) > 0
    wallorder = wallordering(1,:);
elseif abs(velocity(1)) < abs(velocity(2)) && velocity(1) > 0 && velocity(2) > 0
    wallorder = wallordering(2,:);
elseif abs(velocity(1)) < abs(velocity(2)) && velocity(1) < 0 && velocity(2) > 0
    wallorder = wallordering(3,:);
elseif abs(velocity(1)) > abs(velocity(2)) && velocity(1) < 0 && velocity(2) > 0
    wallorder = wallordering(4,:);
elseif abs(velocity(1)) > abs(velocity(2)) && velocity(1) < 0 && velocity(2) < 0
    wallorder = wallordering(5,:);
elseif abs(velocity(1)) < abs(velocity(2)) && velocity(1) < 0 && velocity(2) < 0
    wallorder = wallordering(6,:);
elseif abs(velocity(1)) < abs(velocity(2)) && velocity(1) > 0 && velocity(2) < 0
    wallorder = wallordering(7,:);
elseif abs(velocity(1)) > abs(velocity(2)) && velocity(1) > 0 && velocity(2) < 0
    wallorder = wallordering(8,:);
end

l=1;
for i = 1:size(T,1)
    for j = 1:size(P,1)
        A = P(j,:);
        B = T(i,:);
        AB = cartesianproduct(A,B);
        AB = invalidtrapezoid(AB,vn);
        AhB = AB(AB(:,1)>=AB(:,2),:);
        AlB = AB(AB(:,1)<=AB(:,2),:);

        validpairsAhB = validpairs(AhB,AhB,K);
        validpairsAlB = validpairs(AlB,AlB,K);
        validjoint = validpairs(validpairsAlB,validpairsAhB,K*2,wallorder);
        if ~isempty(validjoint)
            for k = 1:size(validjoint,1)
                totaljoint(l) = {validjoint(k,:)};
                l = l+1;
            end
        end
    end
end
totaljoint = cell2mat(totaljoint');
totaljoint = totaljoint(totaljoint(:,1)>0,:);
output = totaljoint;
end