% -------------------------------------------------------------------------
% This is a solution to problem 2 in HW4
% -------------------------------------------------------------------------
load('U.mat');
load('x.mat');
n = length(x);
% Representation of e_1 in the basis U
e1 = zeros(n,1);
e1(1) =  1;
c_e1 = U'*e1;
figure
scatter(1:n,c_e1,'r')
% Representation of x in the basis U
c = U'*x;
figure
scatter(1:n,c,'r')
% Random measurement operator
A = (1/sqrt(60))*randn(60,1000);
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

