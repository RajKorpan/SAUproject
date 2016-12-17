function [output] = enumeratevalidlines(tangentlinesposterior,sloperange,interceptrange,rnm1,rn)
% Function that was used while testing the algorithm

sortedtlp1 = tangentlinesposterior(:,:,1);
sortedtlp1 = sort(sortedtlp1(:),'descend');
[s1,i1]=find(tangentlinesposterior(:,:,1)>=sortedtlp1(2));
line1 = [sloperange(s1);interceptrange(i1)];

sortedtlp2 = tangentlinesposterior(:,:,2);
sortedtlp2 = sort(sortedtlp2(:),'descend');
[s2,i2]=find(tangentlinesposterior(:,:,2)>=sortedtlp2(2));
line2 = [sloperange(s2);interceptrange(i2)];

sortedtlp3 = tangentlinesposterior(:,:,3);
sortedtlp3 = sort(sortedtlp3(:),'descend');
[s3,i3]=find(tangentlinesposterior(:,:,3)>=sortedtlp3(2));
line3 = [sloperange(s3);interceptrange(i3)];

sortedtlp4 = tangentlinesposterior(:,:,4);
sortedtlp4 = sort(sortedtlp4(:),'descend');
[s4,i4]=find(tangentlinesposterior(:,:,4)>=sortedtlp4(2));
line4 = [sloperange(s4);interceptrange(i4)];

vallines = [];
for a = 1:size(line1,2)
    for b = 1:size(line2,2)
        for c = 1:size(line3,2)
            for d = 1:size(line4,2)
                lines = [line1(1,a),line1(2,a),line2(1,b),line2(2,b),line3(1,c),line3(2,c),line4(1,d),line4(2,d)];
                if validlines(lines,rnm1,rn) == 1
                    vallines = [vallines; lines];
                end
            end
        end
    end
end
output = vallines;
end