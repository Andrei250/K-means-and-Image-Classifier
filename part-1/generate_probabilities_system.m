function [A, b] = generate_probabilities_system(rows)
	n = rows * (rows + 1) / 2;
	b = zeros(n, 1);
	A = 4 .* eye(n);
	b(n : -1 : n - rows + 1) = 1;
	begin = 1;
	A(1, 1) = 2;

	for i = 1 : rows - 1
		final = i * (i + 1) / 2;
		A(begin, begin + i) = A(begin, begin + i + 1) = -1;
		A(begin + i, begin) = A(begin, begin + 1) = -1;
		A(begin + i + 1, begin) = A(begin + 1, begin) = -1;
		A(begin, begin) ++;
		for j = begin + 1 : (final - 1)
			A(j, j) += 2;
			A(j, j + i) = A(j, j + i + 1) = A(j, j + 1) = -1;
			A(j + i, j) = A(j + i + 1, j) = A(j + 1, j) = -1;
		endfor
		A(final, final)++;
		A(final, final + i) = A(final, final + i + 1) = -1;
		A(final + i, final) = A(final + i + 1, final) = -1;
		begin = final + 1;
	endfor

	for j = begin : rows * (rows + 1) / 2 - 1
		A(j, j)++;
		A(j + 1, j) = A(j, j + 1) = -1;
	endfor

	A(begin, begin) --;


endfunction