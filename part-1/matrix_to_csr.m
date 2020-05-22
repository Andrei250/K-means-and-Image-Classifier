function [values, colind, rowptr] = matrix_to_csr(A)
	[n, m] = size(A);
	B = A';
	indices = find(B);
	values = (B(indices))';
	colind = (indices - (floor((indices - 1) / n) * n))';
	rowptr = [];
	for i = 1 : n
		rowptr = [rowptr, find(indices == (n * (i - 1) + find(B(:, i), 1))) ];
	endfor

	rowptr = [rowptr, length(values) + 1];
endfunction