function [w] = learn(X, y)
	endvect = y;
	endvect = 1;
	[N, M] = size(X);
	X(:, M + 1) = endvect;
	M++;
	[Q, R] = Householder(X);
	y = Q' * y;
	w = SST(R, y);
end
