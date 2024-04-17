% -------------------------------------------------------------------------
% This script implements the iterative hard thresholding algorithm
% Input: Measurement matrix A of size m by n
%      : Measurments b of size m by 1
%      : k is the desired sparsity level of the underlying vector/signal
% Output: y =  The k-sparse vector solution to Ax=b
% Abiy Tasissa, 3/23/2021
% -------------------------------------------------------------------------
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