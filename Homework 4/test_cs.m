% -------------------------------------------------------------------------
% This generates a sparse signal in some basis
% -------------------------------------------------------------------------
% n = 1000;
% U_1  = eye(n,n);
% [~,~,V] = svd(rand(n,n));
% U =  V*U_1;
% % generate a sparse vector
% idx = randperm(n);
% s = 3;
% c = zeros(n,1);
% c(idx(1:s))=1;
% x= U*c;
n = 1000;
load('U.mat');
load('x.mat');
c = U'*x;
% Random measurement operator
A = (1/sqrt(50))*randn(50,1000);
b = A*c;
% % ISTA algorithm
% y = zeros(n,1);
% t = 1/200.0;
% alpha = 0.3;
% for i  = 1:1000
%     y =  y  - A'*(A*y-b);
%     [~,idx] = sort(abs(y),'descend');
%     z= zeros(n,1);
%     z(idx(1:3)) =y(idx(1:3));
%     y = z;
%     
%     %y  = max(abs(y)-t*alpha,0).*sign(y);
% end
[y]=  IH(A,b,3);
plot(c,'ro')
hold on
plot(y,'b*')





