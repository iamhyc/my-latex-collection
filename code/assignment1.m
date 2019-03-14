
fid = fopen('HW1.txt');
arr = fscanf(fid, '%d\n');

rng = [min(arr), max(arr)];
%histogram(arr, 25, 'Normalization', 'pdf');

alpha=1; beta=1;
lambda=(alpha - 1 + sum(arr)) / (length(arr)+beta);
disp(lambda);

x = linspace(rng(1), rng(2), 10000);
figure(1);
hold on;
y1 = gampdf(1+sum(arr), 1+length(arr), x);
y2 = gampdf(100+sum(arr), 1+length(arr), x);
y3 = gampdf(10+sum(arr), 1+length(arr), x);
subplot(1, 3, 1); plot(x, y1);
subplot(1, 3, 2); plot(x, y2);
subplot(1, 3, 3); plot(x, y3);
%legend(['c'; 'd'; 'e'])