%histogram_equalization
f=imread('a.tif');
figure; imshow(f);
figure; imhist(f);

[M,N] = size(f);
n = zeros([1 256]);		%n = histogram array
for i = 1: M
	for j= 1: N
		t = f(i,j);
		n(t+1) = n(t+1) + 1;
	end
end

s = zeros([1 256]); 	%s = intesity level
C = 255 / (M*N);
for i = 1: M
	for j= 1: N
		t = f(i,j);
		for k = 0:t
			s(t+1) = s(t+1) + n(k+1);
		end
		s(t+1) = round(C * s(t+1));
	end
end

for i = 1: M
	for j= 1: N
		t = f(i,j);
		f(i,j) = s(t+1);
	end
end
figure; imshow(f, []);
figure; imhist(f);	
