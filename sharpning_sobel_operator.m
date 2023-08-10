%sharpning_sobel_operator
f = im2double(imread('c.tif'));
[M,N] = size(f);
s = 1;
f_padded = padarray(f, [s s]);
h_x = [-1 -2 -1; 0 0 0; 1 2 1];
h_y = [-1 0 1; -2 0 2; -1 0 1];
g_x = zeros([M N]);
g_y = zeros([M N]);
for i =s+1: size(f_padded,1) - s		
	for j=s+1: size(f_padded,2) - s	
		neighbour = f_padded(i-s:i+s, j-s:j+s);
		g_x(i-s, j-s) = sum(sum(neighbour .* h));
		g_y(i-s, j-s) = sum(sum(neighbour .* h));
	end
end
g = abs(g_x) + abs(g_y);
figure; imshow(f);
figure; imshow(g, []);