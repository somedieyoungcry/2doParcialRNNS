clear all;
clc;
Val1 = [1  1  1 
      -1  1 -1
      -1  1 -1]
  
%image(Val1, 'CDataMapping' ,'scaled')
Val2 = [-1 -1  1 
        -1  1 -1 
         1 -1  1]
image(Val2, 'CDataMapping' ,'scaled')
recuperacion = []

for i = 1:length(Val1)
    disp(['Iteracion:',i])
    w = Val1(i,:)' * Val1(i,:)
    %image(w, 'CDataMapping' ,'scaled')
    recuperacion(i,:) = w * Val2(i,:)'
    %image(recuperacion, 'CDataMapping' ,'scaled')
    recuperacionFinal = hardlims(recuperacion)
    %image(recuperacionFinal, 'CDataMapping' ,'scaled')
end
   