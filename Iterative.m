function prev_R = Iterative(nume, d, eps)  
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
  
  K = zeros(N, N);

  #Aflarea lui K
  for i = 1:N
    K(i, i) = sum(A(i, :));
  endfor  
  
  M = (inv(K) * A)';

  prev_R =  ones(N, 1) * (1/N);
  R = ones(N ,1) * (1/N);
  
  #Aflarea vectorului de PageRank
  while(1) 
    R = d*M*prev_R + ((1 - d)/N).*ones(N, 1);
    err = norm(R - prev_R);

    if(err < eps)
      return;
     endif
    
    prev_R = R;

  endwhile  
  
endfunction