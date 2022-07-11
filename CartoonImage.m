A = double(imread('PhotoHere.jpg'));



A = A / 255; 
imagesc(A); 
title('Original Image');
img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);

fprintf("\nThis might take some time. (4-5 minutes)(depending on the image)\n\n");
K = 12; 
max_iters = 2;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('\nApplying K-Means to compress an image.\n\n');

idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:);

X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
figure(1);
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Cartoon Image'));


fprintf('Image Saved');
saveas (1,"cartoonImage.jpg");
