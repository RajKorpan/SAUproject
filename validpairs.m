function [output] = validpairs(array1,array2,col,wallorder)
% Function that takes two sets of Echoes and returns the valid pairs of
% those echoes

validpairs = zeros(size(array1,1)*size(array2,1),col);
count = 0;
if col == 4
    for i = 1:size(array1,1)
        for j = i:size(array2,1)
            count = count+1;
            if (array1(i,1)~=array2(j,1) && array1(i,2)~=array2(j,2))
                validpairs(count,:) = [array1(i,:) array2(j,:)];
            end
        end
    end
elseif col == 8
    for i = 1:size(array1,1)-1
        for j = i+1:size(array2,1)
            count = count+1;
            if (array1(i,1)~=array2(j,1) && array1(i,1)~=array2(j,3) && array1(i,3)~=array2(j,1) && array1(i,3)~=array2(j,3) && array1(i,2)~=array2(j,2) && array1(i,2)~=array2(j,4) && array1(i,4)~=array2(j,2) && array1(i,4)~=array2(j,4))
                pairs = [array1(i,1:2);array1(i,3:4);array2(j,1:2);array2(j,3:4)];
                validpairs(count,:) = correctechoorder(pairs,wallorder);
            end
        end
    end
end
validpairs = validpairs(validpairs(:,1)>0,:);
output = validpairs;
end

