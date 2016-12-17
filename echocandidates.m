function [output] = echocandidates(RIR,Fs,K,q,origSound)
% Function that computes the echo candidates from a room impulse response

if nargin < 5
   noOrigSound = 1;
end

if noOrigSound == 1
    [pks,locs] = findpeaks(RIR,'MinPeakDistance',20,'NPeaks',q,'MinPeakHeight',0.01);
    TOA = locs/Fs;
    output = combnk(TOA(2:end),K);
else
    [crosscorr,~] = xcorr(RIR, origSound);
    [~,idx] = max(abs(crosscorr));
    zeroedcrosscorr = crosscorr;
    zeroedcrosscorr(1:idx) = 0;
    [pks,locs] = findpeaks(abs(zeroedcrosscorr));
    [pks2,locs2] = findpeaks(pks);
    %pks2 = pks2(pks2>mean(pks2));
    %locs2 = locs2(1:size(pks2,1));
    locs2 = locs2(1:q);
    TOA = (locs(locs2)-size(RIR,1))/Fs;
    TOA = TOA(TOA>0);
    output = combnk(TOA,K);
end

end