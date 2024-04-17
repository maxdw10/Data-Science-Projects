% -------------------------------------------------------------------------
% This script show how to read and show an image in MATLAB
% Example Image: panies.jpg
% -------------------------------------------------------------------------
% Read the image and store it as matrix A
Panises = imread('panises.jpg');
A = double(Panises);
% Finding the Singular value decomposition of A
[U,S,V ] = svd(A);
% Plotting a matrix as an image
figure
colormap(gray)
imagesc(A)
axis off


