room = [5 4 3.5];
absorp = [.12 .12 .12 .12 .6 .4]';
Fs = 22050;
mic = zeros(20,3);
src = zeros(20,3);
rir = zeros(20,15000);

for i = 1:20
    position = [room(1)*rand,room(2)*rand, 1];
    mic(i,:) = position+.02*randn(1,3);
    src(i,:) = position+.02*randn(1,3);
    rira = rlrs(room, mic(i,:), src(i,:), 15000, absorp);
    rir(i,:) = transpose((rira(:,1)+rira(:,2))/2);
end
rirt = transpose(rir);

%origSound = rir(:,1);
%initialRIR = rir(:,1);
robotposition1 = [0,0];
Kwalls = 4;
%U = zeros(20,4);
q = 20;
rpositionprior1 = [0,0;0,0;0,0];
xrange = -room(1):0.1:room(1);
yrange = -room(2):0.1:room(2);
sloperange = -3:0.01:3;
interceptrange = -3:0.01:3;
walls = 1:Kwalls;
tangentlinepriorAD = ones(length(sloperange),length(interceptrange),length(walls))/sum(sum(sum(ones(length(sloperange),length(interceptrange),length(walls)))));

EchoCandidatesAD1 = echocandidates(rirt(:,1),rirt(:,1),Fs,Kwalls,q);
%U(1,:) = mean(EchoCandidates1);

%robotposition2 = [1.051,1.702];
velocity1 = mic(2,:)-mic(1,:);
rpositionposterior1 = robotposition(velocity1,rpositionprior1,xrange,yrange);
[y1hat,x1hat]=find(rpositionposterior1==max(max(rpositionposterior1)));
rpositionprior2 = [xrange(x1hat),yrange(y1hat);0.2,0;0,0.2];
%RIR2 = audio2;
EchoCandidatesAD2 = echolabelling(mean(EchoCandidatesAD1),rirt(:,1),rirt(:,2),Fs,Kwalls,q,robotposition1,[xrange(x1hat),yrange(y1hat)]);
%U(2,:) = mean(EchoCandidates2(:,[2,4,6,8]));
tangentlinesposteriorAD1 = bayesfilter(EchoCandidatesAD2,robotposition1,[xrange(x1hat),yrange(y1hat)],sloperange,interceptrange,walls,tangentlinepriorAD);
maxlinesAD1 = enumeratevalidlines(tangentlinesposteriorAD1,sloperange,interceptrange,robotposition1,[xrange(x1hat),yrange(y1hat)]);