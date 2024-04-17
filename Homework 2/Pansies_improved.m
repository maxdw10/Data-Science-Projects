clc, clearvars


% Initialize A from the image of the pansies
A = imread('panises.jpg');


% Convert A to a double so we can work with it
X = double(A);

% Perform the SVD on the new matrix
[U, S, V] = svd(X);

% Plot the diagonal values of S, i.e. the singular values of X
figure(1)
plot(diag(S))

% Set a truncation number
k = 10;


% Take the matrices from the SVD and truncate them at k
% then multiply them back to gether to get an approximation
% for our original matrix
Xapprox = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';



% takes our approximation and displays it as an image (in grayscale)
figure(2)
colormap(gray)
imagesc(Xapprox)