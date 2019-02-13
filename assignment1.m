
fid = fopen('HW1.txt');
arr = fscanf(fid, '%d\n');

rng = [min(arr), max(arr)];
histogram(arr, 25);

alpha=1; beta=1;
lambda=(alpha - 1 + sum(arr)) / (length(arr)+beta);
disp(lambda);