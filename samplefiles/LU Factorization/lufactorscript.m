A = rand(3, 3);
b = rand(3, 1);
[lu, pvt] = LUfactor(A);
x = LUsolve(lu, b, pvt)