function R = Algebraic(nume, d)
  imagine = dlmread(nume , " ");
  N = imagine(1, 1);
  A = zeros(N, N);
  
  #Matricea de adiacenta
  for i = 2:(N + 1)
   for j = 3:(2 + imagine(i,2))
     if(imagine(i, j) != 0)
        A((i - 1), imagine(i, j)) = 1;
      endif
    endfor
  endfor
  
  #Zeroizarea diagonalei
  for i = 1:N
    A(i, i) = 0;
  endfor
  
  #Generarea matricei K
  K = zeros(N, N);
  for i = 1:N
    K(i, i) = sum(A(i, :));
  endfor  
  
  #Aflarea vectorului de PageRank
  M = (PR_Inv(K) * A)'; 
  R = PR_Inv(eye(N) - d*M) * ((1-d)/N) * ones(N,1);

 endfunction