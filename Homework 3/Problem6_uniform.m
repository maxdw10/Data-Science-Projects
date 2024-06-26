clc, clearvars


% Load data from file
M = csvread('uniform_noisy.csv');

% Set the number of vectors to use
n = height(M);

% First calculate the mean
m = mean(M,1);

% Then center the input Data
M_centered = M - m;

% Then compute the covariance matrix
S = (1/n) * (M_centered' * M_centered);

% Principal components will be eigenvectors of the covariance matrix
[P, D] = eig(S);


% display the results in terms of eigenvectors and eigenvalues
disp('The principal components are')

disp(P)

disp('The respective eigenvalues are')

disp(diag(D) .* diag(D))

% Note that this code does not put principal components in order of
% significance
