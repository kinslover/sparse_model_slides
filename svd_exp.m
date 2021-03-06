n = 100;
p = 10;

lambda = 30;

X = normrnd(0, 1, n, p);

X_c = X - repmat(sum(X), n, 1);

y = X * normrnd(0, 0.3, p, 1) + normrnd(0, 0.1, n, 1);

[U, D, V] = svd(X_c, 'econ');


coordinates = U' * y;


sk = zeros(p, 1);

for j =1:p
    sk(j) = D(j,j)^2/(D(j,j)^2 + lambda);
end

sk

coordinates_shrink = sk.*coordinates;


%subplot(1, 2, 1)
plot(1:p, coordinates, 'xr', 'markersize', 20)
%subplot(1, 2, 2)
hold on
plot(1:p, coordinates_shrink, '.b', 'markersize', 20)
hold off

legend('Least Squares', 'Ridge Regression')