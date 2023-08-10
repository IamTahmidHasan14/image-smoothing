%Neighbourhood_operation
%smoothing
%(i-1, i+1, j-1, j+1)  for 3x3 neighbour
f=imread('b.tif');
[M,N] = size(f);
f_padded = padarray(f, [1 1]);
g = zeros([M N]);
for i =2: size(f_padded,1) - 1		%(something,1) = 1st dimention
	for j=2: size(f_padded,2) - 1	%(something,2) = 2nd dimention
		neighbour = f_padded(i-1:i+1, j-1:j+1);
		g(i-1, j-1) = max(max(neighbour));  	%one max for row, another max for column
		%g(i-1, j-1) = min(min(neighbour));
		%g(i-1, j-1) = median(median(neighbour));
		%g(i-1, j-1) = mean(mean(neighbour));
	end
end
figure; imshow(f);
figure; imshow(g, []);	%[] for finding the min and max range from the image
