#### Solve Linear Equations

"""
In general, a linear equation system can be written on the form:
    A(m,n)*X(n*1)=B(m*1)
"""

using LinearAlgebra

# Input a m*n array as the coefficient term matrix
A = [1 6 4 3;
     6 2 1 9;
     5 4 6 6;
     4 5 2 5;]

# Input a m*1 array as the constant term matrix
B = [4;3;6;1]
# The augmented matrix
C = hcat(A,B)
# A zeros vector:
Z = zeros(size(B,1),1)
if iszero(B) == true
    println("The original equations set is homogeneous.")
elseif iszero(B) == false
    println("The original equations set is not homogeneous.")
end

# The number of unknowns
n = size(A,2)
# The rank of coefficient term matrix
Ra = rank(A)
# The rank of augmented matrix
Rc = rank(C)
# Calculate the value of determinant
Da = det(A)

if Ra < Rc
    println("The original equations set has no solutions set.")
elseif Ra == Rc
    if Ra == n
        println("The original equations set has one solutions set.")
    elseif Ra < n
        println("The original equations set has infinite solution sets.")
    end
end

# Calculate the solution vector with A*X=B => X=inv(A)*B
if Ra == Rc & Ra ==n
    X = inv(A)*B
    println("The solutions of your equation sets is:")
    for i in 1:length(X)
        println("x[$i] = $(X[i])")
    end
end