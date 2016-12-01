function [output] = pointtolinedist(linepoint1,linepoint2,point,error)
x0 = point(1,1);
y0 = point(1,2);
x1 = linepoint1(1,1);
y1 = linepoint1(1,2);
x2 = linepoint2(1,1);
y2 = linepoint2(1,2);

dist = abs((y2-y1)*x0-(x2-x1)*y0+x2*y1-y2*x1)/sqrt((y2-y1)^2+(x2-x1)^2);
output = abs(normrnd(dist,error));
end