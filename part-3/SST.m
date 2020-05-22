function [x] = SST(A, b)
	[n, m] = size(A);
	w = min(n, m);
  	x = zeros(m, 1);
  	for i = w : -1 : 1
  	  	s = 0;
  	  	k = [(i + 1) : m];
  	  	s += (A(i,k) * x(k));
	    x(i) = (b(i) - s) / A(i,i);
	endfor
end
    