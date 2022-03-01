function [y] = Apartenenta(x, val1, val2)
  #Aflarea coeficientilor
  a = 1/(val2- val1);
  b = -(val1/(val2- val1)); 
  
  #Cazurile
  if x < val1
    y = 0;
  elseif (x >= val1 && x <= val2)
    y = a * x + b;
  elseif (x > val2)
    y = 1;
   endif
endfunction