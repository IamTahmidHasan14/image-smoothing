%sharpning_laplacian
f = im2double(imread('c.tif'));
[M,N] = size(f);
s = 1;
f_padded = padarray(f, [s s]);
g = zeros([M N]);
h = [0 -1 0; -1 5 -1; 0 -1 0];
for i =s+1: size(f_padded,1) - s		
	for j=s+1: size(f_padded,2) - s	
		neighbour = f_padded(i-s:i+s, j-s:j+s);
		g(i-s, j-s) = sum(sum(neighbour .* h));
	end
end
figure; imshow(f);
figure; imshow(g, []);
