%Trying to use K-Means clustering to compress an image

%------

fprintf('\nRunning K-Means clustering on the pixels of an image\n');

picture=double(imread('bird_small.png'));


%dividing by 255 so that all values are in the range 0-1
picture=picture/255;

pic_size=size(picture);



X=reshape(picture,pic_size(1)*pic_size(2),3);

%Random initialization of K and number of iterations

K=16;
no_of_iterations=10;

initial_centroids=kMeansInitCentroid(X,K);

[centroids, idx] = runkMeans(X, initial_centroids, no_of_iterations);

%fprintf('Program paused. Press enter to continue.\n');
%pause;

fprintf('\n Applying K-Means clustering to compress an image \n');

idx = findClosestCentroids(X, centroids);

% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by its index in idx) to the centroid value
X_recovered = centroids(idx,:);

% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
