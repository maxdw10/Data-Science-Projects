% -------------------------------------------------------------------------
% This code implements the Kernel PCA using The Gaussian Kernel
% -------------------------------------------------------------------------
function [Y,V] = kernel_PCA(X,r)
% The convention is that the data is n points in dimensions
% The rows are the data points and the columns are the features
% Construct the Kernel
% K(x,y) = exp(-||x-y||^2/(2*sigma)^2)
% The construction here is for illustration (the code can definitely be
% vectorized for efficiency)
% K is n times n matrix, sigma is the Kernel parameter
num_pts = size(X,1);
sigma = 2;
K = zeros(num_pts,num_pts);
data_norms = sum(X.*X,2);
K = data_norms*ones(1,num_pts)+ones(num_pts,1)*data_norms'-2*(X*X');
K = exp(-K/(2*sigma^2));
K = 0.5*(K+K');
% Center the Kernel
% Define (1/n)*1 where 1 is the matrix of ones
ones_matrix = (1/num_pts)*ones(num_pts,num_pts);
K = K-ones_matrix*K-K*ones_matrix+ones_matrix*K*ones_matrix;
K = 0.5*(K+K');
K = real(K);
% Find eigenvalues and eigenvectors of K
[V,Lam ] = eig(K);
V = real(V);
% Scaled eigenvalues matrix
D = Lam/num_pts;
[D,idx] = sort(diag(D),'descend');
V = V(:,idx);
% Finally project to r principal components
Y = zeros(num_pts,r);
for k = 1:r
    Y(:,k) = K*V(k,:)';
end
end









