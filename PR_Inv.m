function X = PR_Inv(A)  
  # Gram-Schmmidt
  
  
  [nr_linii nr_coloane] = size(A);
  
  Q = A;
  R = zeros(nr_linii, nr_coloane);
  
  for i = 1:nr_coloane
    R(i, i) = norm(Q(:, i));
    Q(:, i) = Q(:, i) ./ R(i, i);
    
    for j = (i + 1):nr_coloane
      R(i, j) = Q(:, i)' * Q(:, j);
      Q(:, j) = Q(:, j) - Q(:, i) * R(i, j);
      
    endfor
  endfor
  
  
  # Calculare inversa
  X = zeros(nr_linii);
  I = eye(nr_linii);
  
  for i  = 1:nr_linii
    X(:,i) = SST(R, (Q') * I(:,i));
  endfor
  
  
  
endfunction