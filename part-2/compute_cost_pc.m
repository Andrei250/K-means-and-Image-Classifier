function [cost] = compute_cost_pc(points, centroids)
	[N, D] = size(points);
	NC = size(centroids, 1);
	cost = 0;
	for i = 1 : N
		minim = norm(centroids(1, :) - points(i, :));

		for j = 2 : NC
			minim = min(minim, norm(centroids(j, :) - points(i, :)));
		endfor

		cost = cost + minim;
	endfor
endfunction

