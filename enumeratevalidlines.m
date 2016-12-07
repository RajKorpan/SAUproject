function [output] = enumeratevalidlines(line1,line2,line3,line4,rnm1,rn)
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