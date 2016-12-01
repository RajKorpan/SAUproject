function [output] = tangentlines(rnm1,rn,Unm1,Un)
nm1 = [rnm1,Unm1];
n = [rn,Un];

if nm1(3)>=n(3)
    c = n(1);
    d = n(2);
    a = nm1(1);
    b = nm1(2);
    r1 = n(3);
    r0 = nm1(3);
elseif nm1(3)<n(3)
    c = nm1(1);
    d = nm1(2);
    a = n(1);
    b = n(2);
    r1 = nm1(3);
    r0 = n(3);
end
distcenters = sqrt((c-a)^2+(d-b)^2);
if distcenters>r0
    xp = (c*r0-a*r1)/(r0-r1);
    yp = (d*r0-b*r1)/(r0-r1);
    xt1 = (((r0^2)*(xp-a)+(r0)*(yp-b)*sqrt((xp-a)^2+(yp-b)^2-(r0)^2))/((xp-a)^2+(yp-b)^2))+a;
    xt2 = (((r0^2)*(xp-a)-(r0)*(yp-b)*sqrt((xp-a)^2+(yp-b)^2-(r0)^2))/((xp-a)^2+(yp-b)^2))+a;
    yt1 = (((r0^2)*(yp-b)-(r0)*(xp-a)*sqrt((xp-a)^2+(yp-b)^2-(r0)^2))/((xp-a)^2+(yp-b)^2))+b;
    yt2 = (((r0^2)*(yp-b)+(r0)*(xp-a)*sqrt((xp-a)^2+(yp-b)^2-(r0)^2))/((xp-a)^2+(yp-b)^2))+b;
    slope1 = (yt1-yp)/(xt1-xp);
    slope2 = (yt2-yp)/(xt2-xp);
    b1 = yt1-(slope1*xt1);
    b2 = yt2-(slope2*xt2);
    %output = [a,b,c,d,r0,r1,xp,yp,xt1,yt1,xt2,yt2,slope1,b1,slope2,b2];
    output = [slope1,b1;slope2,b2];
else
    output = [];
end
end

