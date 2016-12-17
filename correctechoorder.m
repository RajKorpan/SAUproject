function [output] = correctechoorder(pairs,wallorder)
% Changes the order of the echoe pairs such that the order is always
% preserved according to the wall positions (assuming that the walls
% surrounding the robot are ordered and numbered 1 to 4)

pair1diff = pairs(1,2)-pairs(1,1);
pair2diff = pairs(2,2)-pairs(2,1);
pair3diff = pairs(3,2)-pairs(3,1);
pair4diff = pairs(4,2)-pairs(4,1);
%pairdiffs = [pair1diff;pair2diff;pair3diff;pair4diff];

[pairdiffs,idx] = sort([pair1diff;pair2diff;pair3diff;pair4diff]);
if pairdiffs(1)/pairdiffs(4) < -1.5 || pairdiffs(1)/pairdiffs(4) > -0.5 || pairdiffs(2)/pairdiffs(3) < -1.5 || pairdiffs(2)/pairdiffs(3) > -0.5
    output = [0,0,0,0,0,0,0,0];
else
    sorted = pairs(idx,:);
    %sorted = sortrows([pair1diff,pair1;pair2diff,pair2;pair3diff,pair3;pair4diff,pair4]);

    wall1 = wallorder(1:2);
    wall2 = wallorder(3:4);
    wall3 = wallorder(5:6);
    wall4 = wallorder(7:8);
    sortedorder = zeros(1,8);

    if wall1 == [0,0]
        sortedorder(1:2) = sorted(1,1:2);
    elseif wall1 == [0,1]
        sortedorder(1:2) = sorted(2,1:2);
    elseif wall1 == [1,1]
        sortedorder(1:2) = sorted(3,1:2);
    elseif wall1 == [1,0]
        sortedorder(1:2) = sorted(4,1:2);
    end

    if wall2 == [0,0]
        sortedorder(3:4) = sorted(1,1:2);
    elseif wall2 == [0,1]
        sortedorder(3:4) = sorted(2,1:2);
    elseif wall2 == [1,1]
        sortedorder(3:4) = sorted(3,1:2);
    elseif wall2 == [1,0]
        sortedorder(3:4) = sorted(4,1:2);
    end

    if wall3 == [0,0]
        sortedorder(5:6) = sorted(1,1:2);
    elseif wall3 == [0,1]
        sortedorder(5:6) = sorted(2,1:2);
    elseif wall3 == [1,1]
        sortedorder(5:6) = sorted(3,1:2);
    elseif wall3 == [1,0]
        sortedorder(5:6) = sorted(4,1:2);
    end

    if wall4 == [0,0]
        sortedorder(7:8) = sorted(1,1:2);
    elseif wall4 == [0,1]
        sortedorder(7:8) = sorted(2,1:2);
    elseif wall4 == [1,1]
        sortedorder(7:8) = sorted(3,1:2);
    elseif wall4 == [1,0]
        sortedorder(7:8) = sorted(4,1:2);
    end

    output = sortedorder;
end
end

