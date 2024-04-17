% -------------------------------------------------------------------------
% This is a demo code that applies Kernel PCA on two concentric circles
% -------------------------------------------------------------------------
angle = 0:0.1:2*pi; 
radius = [0.5;2];
X_coordinate = [];
Y_coordinate = [];
% Create the concetric circles
for i = 1:2
    % Add some noise
    x = radius(i)*cos(angle);
    y = radius(i)*sin(angle);
    x = x';
    y = y';
    X_coordinate = [X_coordinate ;x];
    Y_coordinate = [Y_coordinate; y];
end
% Data matrix
X = [X_coordinate Y_coordinate];
% Apply Regular PCA
X_c = X - mean(X);
S = (1/size(X,1))*(X_c'*X_c);
[U,D ] = eig(S);
% Project onto the first two principal components
% Basically, it just gives us the data back in this case
pca_projection = X*U(:,1:2);
% Plot the PCA projections
figure
scatter(pca_projection(1:63,1),pca_projection(1:63,2),'r')
hold on
scatter(pca_projection(64:126,1),pca_projection(64:126,2),'b')

xlabel('Projection onto first principal component')
ylabel('Projection onto second principal component')
title('PCA applied to two concetric cicrcles')

% Apply Kernel PCA
[kernel_pca_projection,V] = kernel_PCA(X,2);
% Plot the Kernel PCA projections
figure
scatter(kernel_pca_projection(1:63,1),kernel_pca_projection(1:63,2),'r')
hold on
scatter(kernel_pca_projection(64:126,1),kernel_pca_projection(64:126,2),'b')
xlabel('Projection onto first principal component')
ylabel('Projection onto second principal component')
title('Kernel PCA applied to two concetric cicrcles')

