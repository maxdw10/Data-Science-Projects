clc, clearvars;


% Load signal vector x
x = csvread("x.csv");

% Load orthonormal basis matrix U
U = csvread("U.csv");

% Generate standard basis vector e1
e1 = [1; zeros(999,1)];

% compute the coordinate of e1 in the basis U
e1_U = U' * e1;

% compute the coordinate of the signal x in the basis U
c = U' * x;

% plot e1, clearly sparse in standard basis
figure(1)
plot(e1)

% plot e1 in the basis U, no longer sparse
figure(2)
plot(e1_U)

% plot signal vector x in the basis U, now a 3 sparse vector
figure(3)
plot(c)

% Set our size for random projection
m = 60;
n = 1000;

% generate a random matrix
Z = rand(m, n);

% make it a projection matrix by dividing
A = (1/(sqrt(m)))* Z;

% find b based on our sparse representation of the signal
b = A * c;

% Run the iterative thresholding algorithm on our projection matrix, the
% vector b, and have it generate a 3 sparse solution
Y = IH(A,b,3);

% plot our original 3 sparse representation vs the new one obtained via
% iterative thresholding
figure(4)
hold on
plot(Y)
plot(c)
hold off

% calculate the reconstruction of the signal using the newly obtained
% representation
x_hat = U * Y;

% Plot the original signal vs the reconstruction
figure(5)
hold on
plot(x)
plot(x_hat)
hold off

% Borrowed iterative thresholding algorithm from Abiy Tasissa
function [y] = IH(A,b,k)
% length of signal
sz = size(A);
n = sz(2);
% IH algorithm
% Initialization
y = zeros(n,1);
for i  = 1:10
    y =  y  - A'*(A*y-b);
    [~,idx] = sort(abs(y),'descend');
    z= zeros(n,1);
    z(idx(1:k)) =y(idx(1:k));
    y = z;
end
end


