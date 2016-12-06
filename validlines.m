function [output] = validlines(tangentlines)
line1 = tangentlines(1:2);
line2 = tangentlines(3:4);
line3 = tangentlines(5:6);
line4 = tangentlines(7:8);
lines = [line1;line2;line3;line4];
alldifferentslopes = ~all(lines(:,1) == lines(1,1));
if alldifferentslopes == 1
    intersectpoints = [];
    for i = 2:4
        x = (lines(i,2)-lines(1,2))/(lines(1,1)-lines(i,1));
        y = lines(1,1)*x+lines(1,2);
        intersectpoints = [intersectpoints; [x,y]];
    end
    for i = 3:4
        x = (lines(i,2)-lines(2,2))/(lines(2,1)-lines(i,1));
        y = lines(2,1)*x+lines(2,2);
        intersectpoints = [intersectpoints; [x,y]];
    end
    for i = 4:4
        x = (lines(i,2)-lines(3,2))/(lines(3,1)-lines(i,1));
        y = lines(3,1)*x+lines(3,2);
        intersectpoints = [intersectpoints; [x,y]];
    end
    diffintersect = unique(intersectpoints,'rows');
    alldifferentintersects = size(diffintersect) == size(intersectpoints);
    if alldifferentintersects == 1
        output = lines;
    else
        output = -2;
    end
else
    output = -1;
end
end