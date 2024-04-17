clc;
clearvars;

% load data matrix
M = csvread("data_067.csv");

% load labels
L = csvread("label_067.csv");

% initialize count of 7's in the data
n = sum(L == 7);

% initialize a matrix to store image vectors corresponding to 7's and preallocate memory
M7 = zeros(n, size(M, 2));

% index variable for M7
idx = 1;

% for as many labels as there are, count the 7's and add those rows to
% the 7's matrix we initialized
for i = 1:length(L)
    if L(i) == 7
        M7(idx, :) = M(i, :);
        idx = idx + 1;
    end
end

% Do PCA on the data to store a full matrix of principal components
P = pca(M, "NumComponents", 784);

% Now for each k on this list, we calculate the reconstruction error
% by summing the squared norm of the difference between each 7 data point
% and its reconstruction from k principal components
k_list = [1 10:10:300];
reconstruction_errors = zeros(size(k_list));

for k_idx = 1:length(k_list)
    k = k_list(k_idx);
    % Calculate the reconstruction for all data points using k principal components
    M7_reconstructed = M7 * P(:, 1:k) * P(:, 1:k)';
    % Calculate the squared norm of the difference for each data point and sum them up
    reconstruction_errors(k_idx) = sum(sum((M7 - M7_reconstructed).^2, 2));
end

% Calculate the average reconstruction error for each k
average_reconstruction_errors = reconstruction_errors / n;

% Plot the results
plot(k_list, average_reconstruction_errors);
xlabel('Number of Principal Components (k)');
ylabel('Reconstruction Error');
title('Average Reconstruction Error vs. Number of Principal Components');