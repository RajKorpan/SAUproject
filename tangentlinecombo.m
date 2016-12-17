function [output] = tangentlinecombo(rnm1,rn,TOAs)
% Function that creates every combination of tangent lines for given the
% robot positions and the times of arrival
tanlines = [tangentlines(rnm1,rn,TOAs(1,1),TOAs(1,2)),tangentlines(rnm1,rn,TOAs(1,3),TOAs(1,4)),tangentlines(rnm1,rn,TOAs(1,5),TOAs(1,6)),tangentlines(rnm1,rn,TOAs(1,7),TOAs(1,8))];
if size(tanlines,2) == 8
    t1 = tanlines(1,1:2);
    t2 = tanlines(1,3:4);
    t3 = tanlines(1,5:6);
    t4 = tanlines(1,7:8);
    b1 = tanlines(2,1:2);
    b2 = tanlines(2,3:4);
    b3 = tanlines(2,5:6);
    b4 = tanlines(2,7:8);

    output = [t1,t2,t3,t4;b1,b2,b3,b4;t1,t2,t3,b4;t1,t2,b3,t4;t1,b2,t3,t4;b1,t2,t3,t4;t1,t2,b3,b4;t1,b2,t3,b4;b1,t2,t3,b4;t1,b2,b3,t4;b1,t2,b3,t4;b1,b2,t3,t4;b1,b2,b3,t4;b1,b2,t3,b4;b1,t2,b3,b4;t1,b2,b3,b4];
else
    output = [];
end
end

