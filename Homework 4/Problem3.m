clc, clearvars;


% Load Data, for the demo I borrowed some data from Satchel

X1 = readmatrix("kmeans_blobs.csv");

X = X1(:,(2:3));

%X = rand(100,2);

% Plot X without labels just to get an idea what the clustering should look
% like
figure(1)
scatter(X(:,1), X(:,2));

% Collect size of data
[n,d] = size(X);

% Set number of clusters, 3 in this case
k = 3;

% Create a random permutation to initizalize centroids
R = randperm(n);

% Initialize centroids using random data points
C = X(R(1:k),:);

% Initizalise a matrix to store euclidean distances
Dist = zeros(1,k);

% Initialize a label vector
Y = zeros(n,1);

% Set the number of iterations to perform
max_iterations = 100;

% Start the count, and use a while loop to iterate calculating the labels
% in Y, then the new centroids given by the means
G = 0;
while G < max_iterations
    G = G + 1;

% This loop populates the distance matrix, then populates the label matrix
% with the label associated with the minimum distance from the centroid
    for i = 1:n
        for j = 1:k
            Dist(j) = norm(X(i,:)-C(j,:));
        end

        [M,I] = min(Dist);

        Y(i) = I;


    end


% This loop adjusts the centroids by calculating the means given by the
% current labeling and updating the centroid matrix
    for l = 1:k
        count = 0;
        Sum = 0;
        for i = 1:n
            if Y(i) == l
                count = count + 1;
                Sum = Sum + X(i,:);
            end
        end

        C(l,:) = (1/count) * Sum;
    end

end
    
% Finally, sort the data into their labels and plot themYk = zeros(n,k);

% need to add more colors if we are going to do more clusters, this is just
% temporary
colors = ['r', 'b', 'g', 'c', 'm', 'y', 'k'];

figure
hold on
for i = 1:k
    Yk = Y==i;
    scatter(X(Yk,1),X(Yk,2), colors(:,i),'filled')
end
    












