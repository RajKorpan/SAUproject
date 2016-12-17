function [output] = cartesianproduct(array1, array2)
% Function that computes the cartesian product of two arrays

[AMat,BMat] = meshgrid(array1, array2);
output = [AMat(:), BMat(:)];
end

