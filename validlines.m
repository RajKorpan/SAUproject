function [output] = validlines(tangentlines,rnm1,rn)
% Function that computes if the set of tangent lines are not all parallel
% and do not intersect at the same point

line1 = tangentlines(1:2);
line2 = tangentlines(3:4);
line3 = tangentlines(5:6);
line4 = tangentlines(7:8);
lines = [line1;line2;line3;line4];
alldifferentslopes = (line1(1,1) ~= line2(1,1)) && (line1(1,1) ~= line3(1,1)) && (line1(1,1) ~= line4(1,1)) && (line2(1,1) ~= line3(1,1)) && (line2(1,1) ~= line4(1,1)) && (line3(1,1) ~= line4(1,1));
if alldifferentslopes == 1
    intersectpoints = zeros(6,2);
    counter = 1;
    for i = 2:4
        x = (lines(i,2)-lines(1,2))/(lines(1,1)-lines(i,1));
        y = lines(1,1)*x+lines(1,2);
        intersectpoints(counter,:) = [x,y];
        counter = counter+1;
    end
    for i = 3:4
        x = (lines(i,2)-lines(2,2))/(lines(2,1)-lines(i,1));
        y = lines(2,1)*x+lines(2,2);
        %intersectpoints = [intersectpoints; [x,y]];
        intersectpoints(counter,:) = [x,y];
        counter = counter+1;
    end
    for i = 4:4
        x = (lines(i,2)-lines(3,2))/(lines(3,1)-lines(i,1));
        y = lines(3,1)*x+lines(3,2);
        %intersectpoints = [intersectpoints; [x,y]];
        intersectpoints(counter,:) = [x,y];
        counter = counter+1;
    end
    diffintersect = 0;
    for i = 1:length(intersectpoints)-1
        for j = i+1:length(intersectpoints)
            if (intersectpoints(i,1) == intersectpoints(j,1)) && (intersectpoints(i,2) == intersectpoints(j,2))
                diffintersect = 1;
                break;
            end
        end
        if diffintersect == 1
            break;
        end
    end
    %alldifferentintersects = sum(diffintersect);
    if diffintersect == 0
        %boundedrnm1 = [(line1(1)*rnm1(1)+line1(2))>rnm1(2),((rnm1(2)-line1(2))/line1(1))>rnm1(1);(line2(1)*rnm1(1)+line2(2))>rnm1(2),((rnm1(2)-line2(2))/line2(1))>rnm1(1);(line3(1)*rnm1(1)+line3(2))>rnm1(2),((rnm1(2)-line3(2))/line3(1))>rnm1(1);(line4(1)*rnm1(1)+line4(2))>rnm1(2),((rnm1(2)-line4(2))/line4(1))>rnm1(1)];
        %boundedrn = [(line1(1)*rn(1)+line1(2))>rn(2),((rn(2)-line1(2))/line1(1))>rn(1);(line2(1)*rn(1)+line2(2))>rn(2),((rn(2)-line2(2))/line2(1))>rn(1);(line3(1)*rn(1)+line3(2))>rn(2),((rn(2)-line3(2))/line3(1))>rn(1);(line4(1)*rn(1)+line4(2))>rn(2),((rn(2)-line4(2))/line4(1))>rn(1)];
        output = 1;
        %if isequal(sum(boundedrnm1),[2,2]) && isequal(sum(boundedrn),[2,2])
        %    output = 1;
        %else
        %    output = 0;
        %end
    else
        output = 0;
    end
else
    output = 0;
end
end