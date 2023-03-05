function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);

    % TODO: fa cast matricii I la double
     I = double(I);
     Ix = zeros(m,n);
     Iy = zeros(m,n);
     Ixy = zeros(m,n);
     It = I';
    % TODO: calculeaza matricea cu derivate fata de x Ix
    for y = 1 : m
      for x = 1 : n
        if(x - 1 >= 1 && x + 1 <= n)
          Ix(y,x) = fx(It,x,y);
      endif
    endfor
  endfor
    % TODO: calculeaza matricea cu derivate fata de y Iy
    for y = 1 : m
      for x = 1 : n
        if( y - 1 >= 1 && y + 1 <= m)
        Iy(y,x) = fy(It,x,y);
        endif
      endfor
    endfor
    
    % TODO: calculeaza matricea cu derivate fata de xy Ixy
    for y = 2 : m-1
      for x = 2 : n-1
        Ixy(y,x) = fxy(It,x,y);
      endfor
    endfor
    
endfunction