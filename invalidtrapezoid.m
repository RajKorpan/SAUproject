function [output] = invalidtrapezoid(input,vn)
% Function that checks if a pair of echo candidates for a valid trapezoid given the velocity

[s1,s2] = size(input);
validpairs = zeros(s1,s2);
for i = 1:s1
    pair = input(i,:);
    if ((vn^2)-0.25*(max(pair)-min(pair))^2) > 0
        validpairs(i,:) = pair;
    end
end
validpairs = validpairs(validpairs(:,1)>0,:);
output = validpairs;
end