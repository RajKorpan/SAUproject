origSound = origaudio;
initialRIR = audio1;
r1 = [0,0];
K = 4;
U = zeros(20,4);

EchoCandidates1 = echocandidates(origSound,initialRIR,Fs,K);
U(1,:) = mean(EchoCandidates1);


r2 = [1.051,1.702];
RIR2 = audio2;
EchoCandidates2 = echolabelling(U(1,:),origSound,RIR2,Fs,K,r1,r2);
U(2,:) = mean(EchoCandidates2(:,[2,4,6,8]));

r3 = [1.867,3.528];
RIR3 = audio3;
EchoCandidates3 = echolabelling(U(2,:),origSound,RIR3,Fs,K,r2,r3);
U(3,:) = mean(EchoCandidates3(:,[2,4,6,8]));

r4 = [4.358,3.320];
RIR4 = audio4;
EchoCandidates4 = echolabelling(U(3,:),origSound,RIR4,Fs,K,r3,r4);
U(4,:) = mean(EchoCandidates4(:,[2,4,6,8]));

r5 = [3.557,3.918];
RIR5 = audio5;
EchoCandidates5 = echolabelling(U(4,:),origSound,RIR5,Fs,K,r4,r5);
U(5,:) = mean(EchoCandidates5(:,[2,4,6,8]));

r6 = [2.558,3.960];
RIR6 = audio6;
EchoCandidates6 = echolabelling(U(5,:),origSound,RIR6,Fs,K,r5,r6);
U(6,:) = mean(EchoCandidates6(:,[2,4,6,8]));

r7 = [1.548,5.686];
RIR7 = audio7;
EchoCandidates7 = echolabelling(U(6,:),origSound,RIR7,Fs,K,r6,r7);
U(7,:) = mean(EchoCandidates7(:,[2,4,6,8]));