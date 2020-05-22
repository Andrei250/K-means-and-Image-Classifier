function [centroids] = clustering_pc(points, NC)
	[N, D] = size(points);
	centroids = zeros(NC, D);
	for i = 1 : NC
		point = zeros(1, D);
		j = i;
		while j <= N
			point = point + points(j, :);
			j = j + NC;
		endwhile
		if mod(j, NC) == 0
			w = j / NC - 1;
		else
			w = floor(j / NC); 
		endif
		centroids(i, :) = point / w;
	endfor

	oldCentroids = zeros(NC, D);

	while norm(centroids - oldCentroids) > 0.001
		position = zeros(NC, 1);
		counters = zeros(1, NC);

		for i = 1 : N
			minim = norm(centroids(1, :) - points(i, :));
			index = 1;

			for j = 2 : NC
				value = norm(centroids(j, :) - points(i, :));
				if value - minim < 0
					minim = value;
					index = j;
				endif
			endfor

			counters(index) = counters(index) + 1;
			position(index, counters(index)) = i;
		endfor

		oldCentroids = centroids;
		
		for i = 1 : NC
			if counters(i) > 0
				point = zeros(1, D);

				for j = 1 : counters(i)
					point = point + points(position(i,j), :);
				endfor

				centroids(i, :) = point / counters(i);
			endif
		endfor
	endwhile
endfunction
