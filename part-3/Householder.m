function [Q, R] = Householder(A)
	[n,m] = size(A);
    Q = eye(n);
    for j = 1 : min(m, n)
        v = A(:, j);
        v(1:(j - 1)) = 0;
        sigma = sign(A(j, j)) * norm(A(j:n, j));
        v(j) = v(j) + sigma;
        H = eye(n) - 2 * (v * v') / (v' * v);
        A = H * A;
        Q = Q * H;
    endfor
    R = A;
endfunction