function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid.


[m n] = size(X);


xc = zeros(K,n);

for i=1:K,
xc(i,1:n) = sum(X(find(idx==i),:));
end

for i=1:K,

centroids(i,1:n) = (1/size(find(idx==i),1))*xc(i,:);

end


end

