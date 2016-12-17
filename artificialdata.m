% Script that creates artificial data and then runs all the steps of the
% code on the artificial data

% Initialize all the features to generate artificial data
room = [5 4 20];
absorp = [0]';
Fs = 22050;
mic = zeros(20,3);
src = zeros(20,3);
rir = zeros(20,15000);
positions = zeros(20,3);
c = 343;

for i = 1:20
    position = [room(1)*rand,room(2)*rand, 10];
    positions(i,:) = position;
    mic(i,:) = position+.02*randn(1,3);
    src(i,:) = position+.02*randn(1,3);
    rira = rlrs(room, mic(i,:), src(i,:), 15000, absorp);
    rir(i,:) = transpose(abs(rira(:,1))+abs(rira(:,2)));
end
rirt = transpose(rir);

robotposition1 = [0,0];
Kwalls = 4;
rpositionprior1 = [0,0;0,0;0,0];
xrange = -room(1):0.05:room(1);
yrange = -room(2):0.05:room(2);
q = 13;

% Produce echo candidates for each position
EchoCandidatesAD1 = echocandidates(rirt(:,1),Fs,Kwalls,q);
EchoCandidatesAD2 = echocandidates(rirt(:,2),Fs,Kwalls,q);
EchoCandidatesAD3 = echocandidates(rirt(:,3),Fs,Kwalls,q);
EchoCandidatesAD4 = echocandidates(rirt(:,4),Fs,Kwalls,q);
EchoCandidatesAD5 = echocandidates(rirt(:,5),Fs,Kwalls,q);
EchoCandidatesAD6 = echocandidates(rirt(:,6),Fs,Kwalls,q);
EchoCandidatesAD7 = echocandidates(rirt(:,7),Fs,Kwalls,q);
EchoCandidatesAD8 = echocandidates(rirt(:,8),Fs,Kwalls,q);
EchoCandidatesAD9 = echocandidates(rirt(:,9),Fs,Kwalls,q);
EchoCandidatesAD10 = echocandidates(rirt(:,10),Fs,Kwalls,q);
EchoCandidatesAD11 = echocandidates(rirt(:,11),Fs,Kwalls,q);
EchoCandidatesAD12 = echocandidates(rirt(:,12),Fs,Kwalls,q);
EchoCandidatesAD13 = echocandidates(rirt(:,13),Fs,Kwalls,q);
EchoCandidatesAD14 = echocandidates(rirt(:,14),Fs,Kwalls,q);
EchoCandidatesAD15 = echocandidates(rirt(:,15),Fs,Kwalls,q);
EchoCandidatesAD16 = echocandidates(rirt(:,16),Fs,Kwalls,q);
EchoCandidatesAD17 = echocandidates(rirt(:,17),Fs,Kwalls,q);
EchoCandidatesAD18 = echocandidates(rirt(:,18),Fs,Kwalls,q);
EchoCandidatesAD19 = echocandidates(rirt(:,19),Fs,Kwalls,q);
EchoCandidatesAD20 = echocandidates(rirt(:,20),Fs,Kwalls,q);

% Calculate velocities from each position to the next position
velocity1 = positions(2,:)-positions(1,:);
velocity2 = positions(3,:)-positions(2,:);
velocity3 = positions(4,:)-positions(3,:);
velocity4 = positions(5,:)-positions(4,:);
velocity5 = positions(6,:)-positions(5,:);
velocity6 = positions(7,:)-positions(6,:);
velocity7 = positions(8,:)-positions(7,:);
velocity8 = positions(9,:)-positions(8,:);
velocity9 = positions(10,:)-positions(9,:);
velocity10 = positions(11,:)-positions(10,:);
velocity11 = positions(12,:)-positions(11,:);
velocity12 = positions(13,:)-positions(12,:);
velocity13 = positions(14,:)-positions(13,:);
velocity14 = positions(15,:)-positions(14,:);
velocity15 = positions(16,:)-positions(15,:);
velocity16 = positions(17,:)-positions(16,:);
velocity17 = positions(18,:)-positions(17,:);
velocity18 = positions(19,:)-positions(18,:);
velocity19 = positions(20,:)-positions(19,:);

% Compute the robot position posterior after each time the robot moves
rpositionposterior1 = robotposition(velocity1,rpositionprior1,xrange,yrange);
[y1hat,x1hat]=find(rpositionposterior1==max(max(rpositionposterior1)));
rpositionprior2 = [xrange(x1hat),yrange(y1hat);0.2,0;0,0.2];

rpositionposterior2 = robotposition(velocity2,rpositionprior2,xrange,yrange);
[y2hat,x2hat]=find(rpositionposterior2==max(max(rpositionposterior2)));
rpositionprior3 = [xrange(x2hat),yrange(y2hat);0.2,0;0,0.2];

rpositionposterior3 = robotposition(velocity3,rpositionprior3,xrange,yrange);
[y3hat,x3hat]=find(rpositionposterior3==max(max(rpositionposterior3)));
rpositionprior4 = [xrange(x3hat),yrange(y3hat);0.2,0;0,0.2];

rpositionposterior4 = robotposition(velocity4,rpositionprior4,xrange,yrange);
[y4hat,x4hat]=find(rpositionposterior4==max(max(rpositionposterior4)));
rpositionprior5 = [xrange(x4hat),yrange(y4hat);0.2,0;0,0.2];

rpositionposterior5 = robotposition(velocity5,rpositionprior5,xrange,yrange);
[y5hat,x5hat]=find(rpositionposterior5==max(max(rpositionposterior5)));
rpositionprior6 = [xrange(x5hat),yrange(y5hat);0.2,0;0,0.2];

rpositionposterior6 = robotposition(velocity6,rpositionprior6,xrange,yrange);
[y6hat,x6hat]=find(rpositionposterior6==max(max(rpositionposterior6)));
rpositionprior7 = [xrange(x6hat),yrange(y6hat);0.2,0;0,0.2];

rpositionposterior7 = robotposition(velocity7,rpositionprior7,xrange,yrange);
[y7hat,x7hat]=find(rpositionposterior7==max(max(rpositionposterior7)));
rpositionprior8 = [xrange(x7hat),yrange(y7hat);0.2,0;0,0.2];

rpositionposterior8 = robotposition(velocity8,rpositionprior8,xrange,yrange);
[y8hat,x8hat]=find(rpositionposterior8==max(max(rpositionposterior8)));
rpositionprior9 = [xrange(x8hat),yrange(y8hat);0.2,0;0,0.2];

rpositionposterior9 = robotposition(velocity9,rpositionprior9,xrange,yrange);
[y9hat,x9hat]=find(rpositionposterior9==max(max(rpositionposterior9)));
rpositionprior10 = [xrange(x9hat),yrange(y9hat);0.2,0;0,0.2];

rpositionposterior10 = robotposition(velocity10,rpositionprior10,xrange,yrange);
[y10hat,x10hat]=find(rpositionposterior10==max(max(rpositionposterior10)));
rpositionprior11 = [xrange(x10hat),yrange(y10hat);0.2,0;0,0.2];

rpositionposterior11 = robotposition(velocity11,rpositionprior11,xrange,yrange);
[y11hat,x11hat]=find(rpositionposterior11==max(max(rpositionposterior11)));
rpositionprior12 = [xrange(x11hat),yrange(y11hat);0.2,0;0,0.2];

rpositionposterior12 = robotposition(velocity12,rpositionprior12,xrange,yrange);
[y12hat,x12hat]=find(rpositionposterior12==max(max(rpositionposterior12)));
rpositionprior13 = [xrange(x12hat),yrange(y12hat);0.2,0;0,0.2];

rpositionposterior13 = robotposition(velocity13,rpositionprior13,xrange,yrange);
[y13hat,x13hat]=find(rpositionposterior13==max(max(rpositionposterior13)));
rpositionprior14 = [xrange(x13hat),yrange(y13hat);0.2,0;0,0.2];

rpositionposterior14 = robotposition(velocity14,rpositionprior14,xrange,yrange);
[y14hat,x14hat]=find(rpositionposterior14==max(max(rpositionposterior14)));
rpositionprior15 = [xrange(x14hat),yrange(y14hat);0.2,0;0,0.2];

rpositionposterior15 = robotposition(velocity15,rpositionprior15,xrange,yrange);
[y15hat,x15hat]=find(rpositionposterior15==max(max(rpositionposterior15)));
rpositionprior16 = [xrange(x15hat),yrange(y15hat);0.2,0;0,0.2];

rpositionposterior16 = robotposition(velocity16,rpositionprior16,xrange,yrange);
[y16hat,x16hat]=find(rpositionposterior16==max(max(rpositionposterior16)));
rpositionprior17 = [xrange(x16hat),yrange(y16hat);0.2,0;0,0.2];

rpositionposterior17 = robotposition(velocity17,rpositionprior17,xrange,yrange);
[y17hat,x17hat]=find(rpositionposterior17==max(max(rpositionposterior17)));
rpositionprior18 = [xrange(x17hat),yrange(y17hat);0.2,0;0,0.2];

rpositionposterior18 = robotposition(velocity18,rpositionprior18,xrange,yrange);
[y18hat,x18hat]=find(rpositionposterior18==max(max(rpositionposterior18)));
rpositionprior19 = [xrange(x18hat),yrange(y18hat);0.2,0;0,0.2];

rpositionposterior19 = robotposition(velocity19,rpositionprior19,xrange,yrange);
[y19hat,x19hat]=find(rpositionposterior19==max(max(rpositionposterior19)));
rpositionprior20 = [xrange(x19hat),yrange(y19hat);0.2,0;0,0.2];

% Calculate the maximum aposteriori after each position
predictedpositions = [rpositionprior1(1,:);rpositionprior2(1,:);rpositionprior3(1,:);rpositionprior4(1,:);rpositionprior5(1,:); rpositionprior6(1,:); rpositionprior7(1,:); rpositionprior8(1,:); rpositionprior9(1,:);rpositionprior10(1,:); rpositionprior11(1,:); rpositionprior12(1,:); rpositionprior13(1,:); rpositionprior14(1,:); rpositionprior15(1,:); rpositionprior16(1,:); rpositionprior17(1,:); rpositionprior18(1,:); rpositionprior19(1,:);rpositionprior20(1,:)];

% Initialize wall ordering for echolabelling function
wallordering = [1,0,1,1,0,0,0,1;1,1,1,0,0,1,0,0;0,1,1,0,1,1,0,0;0,0,1,1,1,0,0,1;0,0,0,1,1,0,1,1;0,1,0,0,1,1,1,0;1,1,0,0,0,1,1,0;1,0,0,1,0,0,1,1];

% Produce each combination of echoes from each position to the next
% position
EchoLabelsAD1 = echolabelling(EchoCandidatesAD1,EchoCandidatesAD2,Kwalls,robotposition1,[xrange(x1hat),yrange(y1hat)],wallordering);
EchoLabelsAD2 = echolabelling(EchoCandidatesAD2,EchoCandidatesAD3,Kwalls,[xrange(x1hat),yrange(y1hat)],[xrange(x2hat),yrange(y2hat)],wallordering);
EchoLabelsAD3 = echolabelling(EchoCandidatesAD3,EchoCandidatesAD4,Kwalls,[xrange(x2hat),yrange(y2hat)],[xrange(x3hat),yrange(y3hat)],wallordering);
EchoLabelsAD4 = echolabelling(EchoCandidatesAD4,EchoCandidatesAD5,Kwalls,[xrange(x3hat),yrange(y3hat)],[xrange(x4hat),yrange(y4hat)],wallordering);
EchoLabelsAD5 = echolabelling(EchoCandidatesAD5,EchoCandidatesAD6,Kwalls,[xrange(x4hat),yrange(y4hat)],[xrange(x5hat),yrange(y5hat)],wallordering);
EchoLabelsAD6 = echolabelling(EchoCandidatesAD6,EchoCandidatesAD7,Kwalls,[xrange(x5hat),yrange(y5hat)],[xrange(x6hat),yrange(y6hat)],wallordering);
EchoLabelsAD7 = echolabelling(EchoCandidatesAD7,EchoCandidatesAD8,Kwalls,[xrange(x6hat),yrange(y6hat)],[xrange(x7hat),yrange(y7hat)],wallordering);
EchoLabelsAD8 = echolabelling(EchoCandidatesAD8,EchoCandidatesAD9,Kwalls,[xrange(x7hat),yrange(y7hat)],[xrange(x8hat),yrange(y8hat)],wallordering);
EchoLabelsAD9 = echolabelling(EchoCandidatesAD9,EchoCandidatesAD10,Kwalls,[xrange(x8hat),yrange(y8hat)],[xrange(x9hat),yrange(y9hat)],wallordering);
EchoLabelsAD10 = echolabelling(EchoCandidatesAD10,EchoCandidatesAD11,Kwalls,[xrange(x9hat),yrange(y9hat)],[xrange(x10hat),yrange(y10hat)],wallordering);
EchoLabelsAD11 = echolabelling(EchoCandidatesAD11,EchoCandidatesAD12,Kwalls,[xrange(x10hat),yrange(y10hat)],[xrange(x11hat),yrange(y11hat)],wallordering);
EchoLabelsAD12 = echolabelling(EchoCandidatesAD12,EchoCandidatesAD13,Kwalls,[xrange(x11hat),yrange(y11hat)],[xrange(x12hat),yrange(y12hat)],wallordering);
EchoLabelsAD13 = echolabelling(EchoCandidatesAD13,EchoCandidatesAD14,Kwalls,[xrange(x12hat),yrange(y12hat)],[xrange(x13hat),yrange(y13hat)],wallordering);
EchoLabelsAD14 = echolabelling(EchoCandidatesAD14,EchoCandidatesAD15,Kwalls,[xrange(x13hat),yrange(y13hat)],[xrange(x14hat),yrange(y14hat)],wallordering);
EchoLabelsAD15 = echolabelling(EchoCandidatesAD15,EchoCandidatesAD16,Kwalls,[xrange(x14hat),yrange(y14hat)],[xrange(x15hat),yrange(y15hat)],wallordering);
EchoLabelsAD16 = echolabelling(EchoCandidatesAD16,EchoCandidatesAD17,Kwalls,[xrange(x15hat),yrange(y15hat)],[xrange(x16hat),yrange(y16hat)],wallordering);
EchoLabelsAD17 = echolabelling(EchoCandidatesAD17,EchoCandidatesAD18,Kwalls,[xrange(x16hat),yrange(y16hat)],[xrange(x17hat),yrange(y17hat)],wallordering);
EchoLabelsAD18 = echolabelling(EchoCandidatesAD18,EchoCandidatesAD19,Kwalls,[xrange(x17hat),yrange(y17hat)],[xrange(x18hat),yrange(y18hat)],wallordering);
EchoLabelsAD19 = echolabelling(EchoCandidatesAD19,EchoCandidatesAD20,Kwalls,[xrange(x18hat),yrange(y18hat)],[xrange(x19hat),yrange(y19hat)],wallordering);

% Initialize features for calculating wall parameter posteriors
sloperange = -15000:1:15000;
interceptrange = -15000:1:15000;
wallprior1AD = ones(length(sloperange),8)/length(sloperange);
wallprior1AD(15001,[1,3,5,7]) = 0;

% Calculate the wall parameter distributions after each position
tangentlinesposteriorAD1 = bayesfilter(EchoLabelsAD1,robotposition1,[xrange(x1hat),yrange(y1hat)],wallprior1AD,c);
tangentlinesposteriorAD2 = bayesfilter(EchoLabelsAD2,[xrange(x1hat),yrange(y1hat)],[xrange(x2hat),yrange(y2hat)],tangentlinesposteriorAD1,c);
tangentlinesposteriorAD3 = bayesfilter(EchoLabelsAD3,[xrange(x2hat),yrange(y2hat)],[xrange(x3hat),yrange(y3hat)],tangentlinesposteriorAD2,c);
tangentlinesposteriorAD4 = bayesfilter(EchoLabelsAD4,[xrange(x3hat),yrange(y3hat)],[xrange(x4hat),yrange(y4hat)],tangentlinesposteriorAD3,c);
tangentlinesposteriorAD5 = bayesfilter(EchoLabelsAD5,[xrange(x4hat),yrange(y4hat)],[xrange(x5hat),yrange(y5hat)],tangentlinesposteriorAD4,c);
tangentlinesposteriorAD6 = bayesfilter(EchoLabelsAD6,[xrange(x5hat),yrange(y5hat)],[xrange(x6hat),yrange(y6hat)],tangentlinesposteriorAD5,c);
tangentlinesposteriorAD7 = bayesfilter(EchoLabelsAD7,[xrange(x6hat),yrange(y6hat)],[xrange(x7hat),yrange(y7hat)],tangentlinesposteriorAD6,c);
tangentlinesposteriorAD8 = bayesfilter(EchoLabelsAD8,[xrange(x7hat),yrange(y7hat)],[xrange(x8hat),yrange(y8hat)],tangentlinesposteriorAD7,c);
tangentlinesposteriorAD9 = bayesfilter(EchoLabelsAD9,[xrange(x8hat),yrange(y8hat)],[xrange(x9hat),yrange(y9hat)],tangentlinesposteriorAD8,c);
tangentlinesposteriorAD10 = bayesfilter(EchoLabelsAD10,[xrange(x9hat),yrange(y9hat)],[xrange(x10hat),yrange(y10hat)],tangentlinesposteriorAD9,c);
tangentlinesposteriorAD11 = bayesfilter(EchoLabelsAD11,[xrange(x10hat),yrange(y10hat)],[xrange(x11hat),yrange(y11hat)],tangentlinesposteriorAD10,c);
tangentlinesposteriorAD12 = bayesfilter(EchoLabelsAD12,[xrange(x11hat),yrange(y11hat)],[xrange(x12hat),yrange(y12hat)],tangentlinesposteriorAD11,c);
tangentlinesposteriorAD13 = bayesfilter(EchoLabelsAD13,[xrange(x12hat),yrange(y12hat)],[xrange(x13hat),yrange(y13hat)],tangentlinesposteriorAD12,c);
tangentlinesposteriorAD14 = bayesfilter(EchoLabelsAD14,[xrange(x13hat),yrange(y13hat)],[xrange(x14hat),yrange(y14hat)],tangentlinesposteriorAD13,c);
tangentlinesposteriorAD15 = bayesfilter(EchoLabelsAD15,[xrange(x14hat),yrange(y14hat)],[xrange(x15hat),yrange(y15hat)],tangentlinesposteriorAD14,c);
tangentlinesposteriorAD16 = bayesfilter(EchoLabelsAD16,[xrange(x15hat),yrange(y15hat)],[xrange(x16hat),yrange(y16hat)],tangentlinesposteriorAD15,c);
tangentlinesposteriorAD17 = bayesfilter(EchoLabelsAD17,[xrange(x16hat),yrange(y16hat)],[xrange(x17hat),yrange(y17hat)],tangentlinesposteriorAD16,c);
tangentlinesposteriorAD18 = bayesfilter(EchoLabelsAD18,[xrange(x17hat),yrange(y17hat)],[xrange(x18hat),yrange(y18hat)],tangentlinesposteriorAD17,c);
tangentlinesposteriorAD19 = bayesfilter(EchoLabelsAD19,[xrange(x18hat),yrange(y18hat)],[xrange(x19hat),yrange(y19hat)],tangentlinesposteriorAD18,c);

% Calculate the maximum aposteriori of the wall parameters after each position
[M1,I1] = max(tangentlinesposteriorAD1);
maxlinesAD1 = [sloperange(I1(1)),interceptrange(I1(2)),sloperange(I1(3)),interceptrange(I1(4)),sloperange(I1(5)),interceptrange(I1(6)),sloperange(I1(7)),interceptrange(I1(8))];

[M2,I2] = max(tangentlinesposteriorAD2);
maxlinesAD2 = [sloperange(I2(1)),interceptrange(I2(2)),sloperange(I2(3)),interceptrange(I2(4)),sloperange(I2(5)),interceptrange(I2(6)),sloperange(I2(7)),interceptrange(I2(8))];

[M3,I3] = max(tangentlinesposteriorAD3);
maxlinesAD3 = [sloperange(I3(1)),interceptrange(I3(2)),sloperange(I3(3)),interceptrange(I3(4)),sloperange(I3(5)),interceptrange(I3(6)),sloperange(I3(7)),interceptrange(I3(8))];

[M4,I4] = max(tangentlinesposteriorAD4);
maxlinesAD4 = [sloperange(I4(1)),interceptrange(I4(2)),sloperange(I4(3)),interceptrange(I4(4)),sloperange(I4(5)),interceptrange(I4(6)),sloperange(I4(7)),interceptrange(I4(8))];

[M5,I5] = max(tangentlinesposteriorAD5);
maxlinesAD5 = [sloperange(I5(1)),interceptrange(I5(2)),sloperange(I5(3)),interceptrange(I5(4)),sloperange(I5(5)),interceptrange(I5(6)),sloperange(I5(7)),interceptrange(I5(8))];

[M6,I6] = max(tangentlinesposteriorAD6);
maxlinesAD6 = [sloperange(I6(1)),interceptrange(I6(2)),sloperange(I6(3)),interceptrange(I6(4)),sloperange(I6(5)),interceptrange(I6(6)),sloperange(I6(7)),interceptrange(I6(8))];

[M7,I7] = max(tangentlinesposteriorAD7);
maxlinesAD7 = [sloperange(I7(1)),interceptrange(I7(2)),sloperange(I7(3)),interceptrange(I7(4)),sloperange(I7(5)),interceptrange(I7(6)),sloperange(I7(7)),interceptrange(I7(8))];

[M8,I8] = max(tangentlinesposteriorAD8);
maxlinesAD8 = [sloperange(I8(1)),interceptrange(I8(2)),sloperange(I8(3)),interceptrange(I8(4)),sloperange(I8(5)),interceptrange(I8(6)),sloperange(I8(7)),interceptrange(I8(8))];

[M9,I9] = max(tangentlinesposteriorAD9);
maxlinesAD9 = [sloperange(I9(1)),interceptrange(I9(2)),sloperange(I9(3)),interceptrange(I9(4)),sloperange(I9(5)),interceptrange(I9(6)),sloperange(I9(7)),interceptrange(I9(8))];

[M10,I10] = max(tangentlinesposteriorAD10);
maxlinesAD10 = [sloperange(I10(1)),interceptrange(I10(2)),sloperange(I10(3)),interceptrange(I10(4)),sloperange(I10(5)),interceptrange(I10(6)),sloperange(I10(7)),interceptrange(I10(8))];

[M11,I11] = max(tangentlinesposteriorAD11);
maxlinesAD11 = [sloperange(I11(1)),interceptrange(I11(2)),sloperange(I11(3)),interceptrange(I11(4)),sloperange(I11(5)),interceptrange(I11(6)),sloperange(I11(7)),interceptrange(I11(8))];

[M12,I12] = max(tangentlinesposteriorAD12);
maxlinesAD12 = [sloperange(I12(1)),interceptrange(I12(2)),sloperange(I12(3)),interceptrange(I12(4)),sloperange(I12(5)),interceptrange(I12(6)),sloperange(I12(7)),interceptrange(I12(8))];

[M13,I13] = max(tangentlinesposteriorAD13);
maxlinesAD13 = [sloperange(I13(1)),interceptrange(I13(2)),sloperange(I13(3)),interceptrange(I13(4)),sloperange(I13(5)),interceptrange(I13(6)),sloperange(I13(7)),interceptrange(I13(8))];

[M14,I14] = max(tangentlinesposteriorAD14);
maxlinesAD14 = [sloperange(I14(1)),interceptrange(I14(2)),sloperange(I14(3)),interceptrange(I14(4)),sloperange(I14(5)),interceptrange(I14(6)),sloperange(I14(7)),interceptrange(I14(8))];

[M15,I15] = max(tangentlinesposteriorAD15);
maxlinesAD15 = [sloperange(I15(1)),interceptrange(I15(2)),sloperange(I15(3)),interceptrange(I15(4)),sloperange(I15(5)),interceptrange(I15(6)),sloperange(I15(7)),interceptrange(I15(8))];

[M16,I16] = max(tangentlinesposteriorAD16);
maxlinesAD16 = [sloperange(I16(1)),interceptrange(I16(2)),sloperange(I16(3)),interceptrange(I16(4)),sloperange(I16(5)),interceptrange(I16(6)),sloperange(I16(7)),interceptrange(I16(8))];

[M17,I17] = max(tangentlinesposteriorAD17);
maxlinesAD17 = [sloperange(I17(1)),interceptrange(I17(2)),sloperange(I17(3)),interceptrange(I17(4)),sloperange(I17(5)),interceptrange(I17(6)),sloperange(I17(7)),interceptrange(I17(8))];

[M18,I18] = max(tangentlinesposteriorAD18);
maxlinesAD18 = [sloperange(I18(1)),interceptrange(I18(2)),sloperange(I18(3)),interceptrange(I18(4)),sloperange(I18(5)),interceptrange(I18(6)),sloperange(I18(7)),interceptrange(I18(8))];

[M19,I19] = max(tangentlinesposteriorAD19);
maxlinesAD19 = [sloperange(I19(1)),interceptrange(I19(2)),sloperange(I19(3)),interceptrange(I19(4)),sloperange(I19(5)),interceptrange(I19(6)),sloperange(I19(7)),interceptrange(I19(8))];

% Remainder of script was used to calculate the wall parameters with the
% true time of arrivals
c = speed_of_sound(20);
trueTOAs = zeros(20,4);
for i = 1:20
    trueTOAs(i,1) = 2*positions(i,1)/c;
    trueTOAs(i,2) = 2*(4-positions(i,2))/c;
    trueTOAs(i,3) = 2*(5-positions(i,1))/c;
    trueTOAs(i,4) = 2*positions(i,2)/c;
end
trueTOAsPaired = zeros(19,8);
for i = 1:19
    trueTOAsPaired(i,1) = trueTOAs(i,1);
    trueTOAsPaired(i,3) = trueTOAs(i,2);
    trueTOAsPaired(i,5) = trueTOAs(i,3);
    trueTOAsPaired(i,7) = trueTOAs(i,4);
    trueTOAsPaired(i,2) = trueTOAs(i+1,1);
    trueTOAsPaired(i,4) = trueTOAs(i+1,2);
    trueTOAsPaired(i,6) = trueTOAs(i+1,3);
    trueTOAsPaired(i,8) = trueTOAs(i+1,4);
end
trueTangentLines = zeros(19,8);
for i = 1:19
    trueTangentLines(i,1:2) = tangentlines(positions(i,1:2),positions(i+1,1:2),trueTOAsPaired(i,1)*c/2,trueTOAsPaired(i,2)*c/2);
    trueTangentLines(i,3:4) = tangentlines(positions(i,1:2),positions(i+1,1:2),trueTOAsPaired(i,3)*c/2,trueTOAsPaired(i,4)*c/2);
    trueTangentLines(i,5:6) = tangentlines(positions(i,1:2),positions(i+1,1:2),trueTOAsPaired(i,5)*c/2,trueTOAsPaired(i,6)*c/2);
    trueTangentLines(i,7:8) = tangentlines(positions(i,1:2),positions(i+1,1:2),trueTOAsPaired(i,7)*c/2,trueTOAsPaired(i,8)*c/2);
end
trueTangentLines2 = [];
for i = 1:19
    trueTangentLines2(i,1:2) = tangentlines(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,1)*c/2,trueTOAsPaired(i,2)*c/2);
    trueTangentLines2(i,3:4) = tangentlines(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,3)*c/2,trueTOAsPaired(i,4)*c/2);
    trueTangentLines2(i,5:6) = tangentlines(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,5)*c/2,trueTOAsPaired(i,6)*c/2);
    trueTangentLines2(i,7:8) = tangentlines(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,7)*c/2,trueTOAsPaired(i,8)*c/2);
end
trueTangentLines2 = [];
for i = 1:length(trueTOAsPaired)
    tl = tangentlinecombo(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,:)*c/2);
    trueTangentLines2 = [trueTangentLines2;tl];
end
trueTangentLines2 = [];
for i = 1:19
    trueTangentLines2 = [trueTangentLines2;tangentlines(mic(i,1:2),mic(i+1,1:2),trueTOAsPaired(i,7)*c/2,trueTOAsPaired(i,8)*c/2)];
end