clc, clearvars

% load data matrix
M = csvread('data_067.csv');

% load label matrix
L = csvread('label_067.csv');

% perform PCA on data for only first 2 principal components
P = pca(M, 'NumComponents', 2);

% Project data onto space spanned by first 2 principal components
M_proj = M * P;

% This commented-out line plots the projected data in R2 but does not
% color code the data, just shows the clustering
%plot(M_proj(:,1), M_proj(:,2), 'x')


% To get color, initialize matrices to collect labeled data
M0 = [];
M6 = [];
M7 = [];

% loop through labels and assign each row to a labeled matrix according
% to its proper label
for i = 1:length(L);
    if L(1,i) == 0;
        M0 = [M0; M_proj(i,:)];
    elseif L(1,i) == 6;
        M6 = [M6; M_proj(i,:)];
    else
        M7 = [M7; M_proj(i,:)];
    end
end

% Plot the labeled data in R2 choosing a different color for each subset
hold on

plot(M0(:,1), M0(:,2), 'rx');

plot(M6(:,1), M6(:,2), 'bx');

plot(M7(:,1), M7(:,2), 'gx');

legend('0', '6', '7')

hold off




      
