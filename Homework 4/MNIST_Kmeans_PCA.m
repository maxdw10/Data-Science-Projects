load('mnist_067.mat');
[~,score] = pca(data_067,'NumComponents',2);
% K means clustering of the latent features
idx = kmeans(score,3,'replicates',100) ;
idx1 = idx==1;
idx2 = idx==2;
idx3 = idx==3;
% Visualize the labelings
figure
scatter(score(idx1,1),score(idx1,2),'r*')
hold on
scatter(score(idx2,1),score(idx2,2),'b')
hold on
scatter(score(idx3,1),score(idx3,2),'g')

