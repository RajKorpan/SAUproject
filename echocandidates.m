function [output] = echocandidates(origSound,RIR,Fs,K)

[crosscorr,~] = xcorr(RIR, origSound);
[~,idx] = max(abs(crosscorr));
zeroedcrosscorr = crosscorr;
zeroedcrosscorr(1:idx) = 0;
[pks,locs] = findpeaks(abs(zeroedcrosscorr));
[pks2,locs2] = findpeaks(pks);
pks2 = pks2(pks2>mean(pks2));
locs2 = locs2(1:size(pks2,1));
TOA = (locs(locs2)-size(RIR,1))/Fs;
TOA = TOA(TOA>0);
output = combnk(TOA,K);

end