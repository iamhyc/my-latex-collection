%% Read Data File
fd = fopen('HW2_logistic_regression.txt');
raw_c = textscan(fd, '%d %f %f', 'HeaderLines', 1);
fclose(fd);
%% Init Data Matrix
raw = zeros(1100, 3);
raw(:,1) = raw_c{1}; raw(:,2) = raw_c{2}; raw(:,3) = raw_c{3};
X_tr = [ones(1000, 1), raw(1:1000, [1,2])]; Y_tr = raw(1:1000, 3);
X_ts = [ones(100, 1), raw(1001:1100, [1,2])]; Y_ts = raw(1001:1100, 3);
%% Solving with Logistic Regression
delta = 1E-4; theta = [0; 0; 0];
k = 0;
while 1
    k = k + 1;
    h = 1./(1 + exp(- X_tr * theta));
    g = X_tr' * (Y_tr - h);
    H = X_tr' * diag(h' * (1-h)) * X_tr;
    if norm(g) < 1E-5
        break;
    else
        theta = theta + H^(-1) * g;
    end
end
%% Evaluation
rss_tr = 1/length(X_tr) * (X_tr * theta  - Y_tr)' * (X_tr * theta  - Y_tr);
rss_ts = 1/length(X_ts) * (X_ts * theta  - Y_ts)' * (X_ts * theta  - Y_ts);
E = [1, 1, 135] * theta;