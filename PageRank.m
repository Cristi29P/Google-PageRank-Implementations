function [R1 R2] = PageRank(nume, d, eps)
  nume_out = strcat(nume, '.out');
  imagine = dlmread(nume , " ");
  val1 = imagine((size(imagine,1)-1), 1);
  val2 = imagine(size(imagine,1), 1);
  
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d, eps);
  
  file_out = fopen(nume_out, 'w');
  
  fprintf(file_out, '%i\n', size(R1,1));
  fprintf(file_out, '\n');
  fprintf(file_out, '%f\n', R1);
  fprintf(file_out, '\n');
  fprintf(file_out, '%f\n', R2);
  fprintf(file_out, '\n');
  
  
  for i = 1:size(R2)
    R2(i,1) = Apartenenta(R2(i,1), val1, val2);;
  endfor
  
  indici1 = 1:size(R2);
 
  R = [indici1' R2];
  
  sorted_R2 = sortrows(R, -2);

  indici2 = 1:size(R2);
  indici2 = indici2';
  
  sorted_R2 = [indici2 sorted_R2];
  
  sorted_R2 = sorted_R2';
  
  fprintf(file_out, "%i %i %f\n", sorted_R2);

  fclose(file_out);
endfunction