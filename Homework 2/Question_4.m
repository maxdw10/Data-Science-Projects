clc, clearvars


%  Initialize A from the given Data
A = importdata("A_test.csv")



%  Since A is not square, we use A-transpose-A
B = A.' * A;


%  Initialize a random vector b_0
b_0 = randn(800, 1);


%  Normalize the vector
b_1 = b_0/norm(b_0);


%  Set a maximum number of iterations to perform the power method
max_iterations = 1000;


%  This for-loop multiplies B by our normalized vector, 
%  then it normalizes the result, 
%  and takes that result and multiplies it with B again
%  until this is done the maximum number of times we set.
%  At the end, we are left with a vector V_new which should
%  approximate the first right singular vector of A

for i = 1:max_iterations
    Bv = B*b_1;
    v_new = Bv / norm(Bv);
    b_1 = v_new;

end

%  This displays our approximated vector
disp(v_new)

%  This computes the SVD of A by the regular eigenvalue method
[U,S,V] = svd(A);

%  Finally we compare our power method vector with the first
%  column of the Right Singular Vector Matrix


norm(abs(v_new) - abs(V(:,1)))