function [output] = cartesianproduct(array1, array2)
[AMat,BMat] = meshgrid(array1, array2);
output = [AMat(:), BMat(:)];
end

