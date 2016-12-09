origSound = origaudio;
initialRIR = audio1;
r1 = [0,0];
K = 4;
U = zeros(7,4);
q = 20;
prior = [0,0;0,0;0,0];
xrange = -6:0.1:6;
yrange = -6:0.1:6;
sloperange = -3:0.01:3;
interceptrange = -3:0.01:3;
walls = 1:4;
tangentlineprior = ones(length(sloperange),length(interceptrange),length(walls))/sum(sum(sum(ones(length(sloperange),length(interceptrange),length(walls)))));

EchoCandidates1 = echocandidates(origSound,initialRIR,Fs,K,q);
U(1,:) = mean(EchoCandidates1);

r2 = [1.051,1.702];
v1 = r2-r1;
positionposterior1 = robotposition(v1,prior,xrange,yrange);
[y1,x1]=find(positionposterior1==max(max(positionposterior1)));
prior2 = [xrange(x1),yrange(y1);1,0;0,1];
RIR2 = audio2;
EchoCandidates2 = echolabelling(U(1,:),origSound,RIR2,Fs,K,q,r1,[xrange(x1),yrange(y1)]);
U(2,:) = mean(EchoCandidates2(:,[2,4,6,8]));
tangentlinesposterior1 = bayesfilter(EchoCandidates2,r1,[xrange(x1),yrange(y1)],sloperange,interceptrange,walls,tangentlineprior);
[s1,i1]=find(tangentlinesposterior1(:,:,1)==max(max(tangentlinesposterior1(:,:,1))));
[s2,i2]=find(tangentlinesposterior1(:,:,2)==max(max(tangentlinesposterior1(:,:,2))));
[s3,i3]=find(tangentlinesposterior1(:,:,3)==max(max(tangentlinesposterior1(:,:,3))));
[s4,i4]=find(tangentlinesposterior1(:,:,4)==max(max(tangentlinesposterior1(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines1 = enumeratevalidlines(line1,line2,line3,line4,r1,[xrange(x1),yrange(y1)]);
for i = 1:length(maxlines1)
    plot(xrange, maxlines1(i,1)*xrange+maxlines1(i,2)); hold on;
    plot(xrange, maxlines1(i,3)*xrange+maxlines1(i,4)); hold on;
    plot(xrange, maxlines1(i,5)*xrange+maxlines1(i,6)); hold on;
    plot(xrange, maxlines1(i,7)*xrange+maxlines1(i,8)); hold on;
end
plotxrange = -2:0.1:9;
plot(plotxrange, maxlines1(1,1)*plotxrange+maxlines1(1,2)); hold on;
plot(plotxrange, maxlines1(1,3)*plotxrange+maxlines1(1,4)); hold on;
plot(plotxrange, maxlines1(1,5)*plotxrange+maxlines1(1,6)); hold on;
plot(plotxrange, maxlines1(1,7)*plotxrange+maxlines1(1,8)); hold on;

r3 = [1.867,3.528];
v2 = r3-r2;
positionposterior2 = robotposition(v2,prior2,xrange,yrange);
[y2,x2]=find(positionposterior2==max(max(positionposterior2)));
prior3 = [xrange(x2),yrange(y2);1,0;0,1];
RIR3 = audio3;
EchoCandidates3 = echolabelling(U(2,:),origSound,RIR3,Fs,K,q,prior2(1,1:2),[xrange(x2),yrange(y2)]);
U(3,:) = mean(EchoCandidates3(:,[2,4,6,8]));
tangentlinesposterior2 = bayesfilter(EchoCandidates3,prior2(1,1:2),[xrange(x2),yrange(y2)],sloperange,interceptrange,walls,tangentlinesposterior1);
sortedtlp2 = tangentlinesposterior2(:,:,1);
sortedtlp2 = sort(sortedtlp2(:),'descend');
[s1,i1]=find(tangentlinesposterior2(:,:,1)==max(max(tangentlinesposterior2(:,:,1))));
[s2,i2]=find(tangentlinesposterior2(:,:,2)==max(max(tangentlinesposterior2(:,:,2))));
[s3,i3]=find(tangentlinesposterior2(:,:,3)==max(max(tangentlinesposterior2(:,:,3))));
[s4,i4]=find(tangentlinesposterior2(:,:,4)==max(max(tangentlinesposterior2(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines2 = enumeratevalidlines(line1,line2,line3,line4,prior2(1,1:2),[xrange(x2),yrange(y2)]);
maxlines2a = enumeratevalidlines(tangentlinesposterior2,sloperange,interceptrange,prior2(1,1:2),[xrange(x2),yrange(y2)]);

r4 = [4.358,3.320];
v3 = r4-r3;
positionposterior3 = robotposition(v3,prior3,xrange,yrange);
[y3,x3]=find(positionposterior3==max(max(positionposterior3)));
prior4 = [xrange(x3),yrange(y3);1,0;0,1];
RIR4 = audio4;
EchoCandidates4 = echolabelling(U(3,:),origSound,RIR4,Fs,K,q,prior3(1,1:2),[xrange(x3),yrange(y3)]);
U(4,:) = mean(EchoCandidates4(:,[2,4,6,8]));
tangentlinesposterior3 = bayesfilter(EchoCandidates4,prior3(1,1:2),[xrange(x3),yrange(y3)],sloperange,interceptrange,walls,tangentlinesposterior2);
[s1,i1]=find(tangentlinesposterior3(:,:,1)==max(max(tangentlinesposterior3(:,:,1))));
[s2,i2]=find(tangentlinesposterior3(:,:,2)==max(max(tangentlinesposterior3(:,:,2))));
[s3,i3]=find(tangentlinesposterior3(:,:,3)==max(max(tangentlinesposterior3(:,:,3))));
[s4,i4]=find(tangentlinesposterior3(:,:,4)==max(max(tangentlinesposterior3(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines3 = enumeratevalidlines(line1,line2,line3,line4,prior3(1,1:2),[xrange(x3),yrange(y3)]);

r5 = [3.557,3.918];
v4 = r5-r4;
positionposterior4 = robotposition(v4,prior4,xrange,yrange);
[y4,x4]=find(positionposterior4==max(max(positionposterior4)));
prior5 = [xrange(x4),yrange(y4);1,0;0,1];
RIR5 = audio5;
EchoCandidates5 = echolabelling(U(4,:),origSound,RIR5,Fs,K,q,prior4(1,1:2),[xrange(x4),yrange(y4)]);
U(5,:) = mean(EchoCandidates5(:,[2,4,6,8]));
tangentlinesposterior4 = bayesfilter(EchoCandidates5,prior4(1,1:2),[xrange(x4),yrange(y4)],sloperange,interceptrange,walls,tangentlinesposterior3);
[s1,i1]=find(tangentlinesposterior4(:,:,1)==max(max(tangentlinesposterior4(:,:,1))));
[s2,i2]=find(tangentlinesposterior4(:,:,2)==max(max(tangentlinesposterior4(:,:,2))));
[s3,i3]=find(tangentlinesposterior4(:,:,3)==max(max(tangentlinesposterior4(:,:,3))));
[s4,i4]=find(tangentlinesposterior4(:,:,4)==max(max(tangentlinesposterior4(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines4 = enumeratevalidlines(line1,line2,line3,line4,prior4(1,1:2),[xrange(x4),yrange(y4)]);

r6 = [2.558,3.960];
v5 = r6-r5;
positionposterior5 = robotposition(v5,prior5,xrange,yrange);
[y5,x5]=find(positionposterior5==max(max(positionposterior5)));
prior6 = [xrange(x5),yrange(y5);1,0;0,1];
RIR6 = audio6;
EchoCandidates6 = echolabelling(U(5,:),origSound,RIR6,Fs,K,q,prior5(1,1:2),[xrange(x5),yrange(y5)]);
U(6,:) = mean(EchoCandidates6(:,[2,4,6,8]));
tangentlinesposterior5 = bayesfilter(EchoCandidates6,prior5(1,1:2),[xrange(x5),yrange(y5)],sloperange,interceptrange,walls,tangentlinesposterior4);
[s1,i1]=find(tangentlinesposterior5(:,:,1)==max(max(tangentlinesposterior5(:,:,1))));
[s2,i2]=find(tangentlinesposterior5(:,:,2)==max(max(tangentlinesposterior5(:,:,2))));
[s3,i3]=find(tangentlinesposterior5(:,:,3)==max(max(tangentlinesposterior5(:,:,3))));
[s4,i4]=find(tangentlinesposterior5(:,:,4)==max(max(tangentlinesposterior5(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines5 = enumeratevalidlines(line1,line2,line3,line4,prior5(1,1:2),[xrange(x5),yrange(y5)]);

r7 = [1.548,5.686];
v6 = r7-r6;
positionposterior6 = robotposition(v6,prior6,xrange,yrange);
[y6,x6]=find(positionposterior6==max(max(positionposterior6)));
prior7 = [xrange(x6),yrange(y6);1,0;0,1];
RIR7 = audio7;
EchoCandidates7 = echolabelling(U(6,:),origSound,RIR7,Fs,K,q,prior6(1,1:2),[xrange(x6),yrange(y6)]);
U(7,:) = mean(EchoCandidates7(:,[2,4,6,8]));
tangentlinesposterior6 = bayesfilter(EchoCandidates7,prior6(1,1:2),[xrange(x6),yrange(y6)],sloperange,interceptrange,walls,tangentlinesposterior5);
[s1,i1]=find(tangentlinesposterior6(:,:,1)==max(max(tangentlinesposterior6(:,:,1))));
[s2,i2]=find(tangentlinesposterior6(:,:,2)==max(max(tangentlinesposterior6(:,:,2))));
[s3,i3]=find(tangentlinesposterior6(:,:,3)==max(max(tangentlinesposterior6(:,:,3))));
[s4,i4]=find(tangentlinesposterior6(:,:,4)==max(max(tangentlinesposterior6(:,:,4))));
line1 = [sloperange(s1);interceptrange(i1)];
line2 = [sloperange(s2);interceptrange(i2)];
line3 = [sloperange(s3);interceptrange(i3)];
line4 = [sloperange(s4);interceptrange(i4)];
maxlines6 = enumeratevalidlines(line1,line2,line3,line4,prior6(1,1:2),[xrange(x6),yrange(y6)]);




Umed = zeros(7,4);
Umed(1,:) = median(EchoCandidates1);
Umed(2,:) = median(EchoCandidates2(:,[2,4,6,8]));
Umed(3,:) = median(EchoCandidates3(:,[2,4,6,8]));
Umed(4,:) = median(EchoCandidates4(:,[2,4,6,8]));
Umed(5,:) = median(EchoCandidates5(:,[2,4,6,8]));
Umed(6,:) = median(EchoCandidates6(:,[2,4,6,8]));
Umed(7,:) = median(EchoCandidates7(:,[2,4,6,8]));

r = [r1;r2;r3;r4;r5;r6;r7];
tlines = [];
for i = 1:6
    tlines = [tlines;tangentlines(r(i,:),r(i+1,:),Umed(i,1),Umed(i+1,1))];
end

tlines4 = [];
for i = 1:length(EchoCandidates2)
    tl = tangentlines(r(1,:),r(2,:),EchoCandidates2(i,7),EchoCandidates2(i,8));
    if ~isempty(tl)
        tlines4 = [tlines4; tl];
    end
end

tlinesb2 = [];
profile on
for i = 1:1000
    tl = tangentlinecombo(r1,r2,EchoCandidates2(i,:));
    if ~isempty(tl)
        for j = 1:length(tl)
            if validlines(tl(j,:),r1,r2) == 1
                tlinesb2 = [tlinesb2; tl];
            end
        end
    end
end
profile viewer