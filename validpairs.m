function [output] = validpairs(array1,array2,col)
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
    for i = 1:size(array1,1)
        for j = 1:size(array2,1)
            count = count+1;
            if (array1(i,1)~=array2(j,1) && array1(i,1)~=array2(j,3) && array1(i,3)~=array2(j,1) && array1(i,3)~=array2(j,3) && array1(i,2)~=array2(j,2) && array1(i,2)~=array2(j,4) && array1(i,4)~=array2(j,2) && array1(i,4)~=array2(j,4))
                pair1 = array1(i,1:2);
                pair2 = array1(i,3:4);
                pair3 = array2(j,1:2);
                pair4 = array2(j,3:4);
                sorted = sortrows([pair1;pair2;pair3;pair4]);
                validpairs(count,:) = [sorted(1,:),sorted(2,:),sorted(3,:),sorted(4,:)];
                %validpairs(count,:) = [array1(i,:) array2(j,:)];
            end
        end
    end
end
validpairs = validpairs(validpairs(:,1)>0,:);
output = validpairs;
end

