clc, clearvars;


% Load data
load('mnist_067.mat');

% Perform PCA on Data obtaining first 2 principal components, store the
% projections in the score matrix
[coeff, score] = pca(data_067, 'NumComponents', 2);


% Perform K-means on the projected data to obtain a label vector
idx = kmeans(score, 3, "Replicates", 100);

% Decompose the label vector into 3 vectors, 1 for each label
idx1 = idx==1;
idx2 = idx==2;
idx3 = idx==3;


% Plot the data in 2D in 3 colors by choosing non-zero rows of the label
% vector as rows of the projected data, then plotting the 2 column entries
% against each other
figure(1)

hold on

scatter(score(idx1,1),score(idx1,2),'r')

scatter(score(idx2,1),score(idx2,2),'b')

scatter(score(idx3,1),score(idx3,2),'g')

hold off

