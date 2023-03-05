function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    Ix=double(Ix);
    Iy=double(Iy);
    Ixy=double(Ixy);
    % TODO: Converte?te matricile intermediare la double.
    B = [1 0 0 0;0 0 1 0;-3 3 -2 -1;2 -2 1 1];
    C = [1 0 -3 2;0 0 3 -2;0 1 -2 1;0 0 -1 1];
    aux1 = [f(y1,x1) f(y1,x2);f(y2,x1) f(y2, x2)];
    aux1 = aux1';
    aux2 = [Ix(y1,x1) Ix(y1,x2);Ix(y2,x1) Ix(y2,x2)];
    aux2 = aux2';
    aux3 = [Iy(y1,x1) Iy(y1,x2);Iy(y2,x1) Iy(y2,x2)];
    aux3 = aux3';
    aux4 = [Ixy(y1,x1) Ixy(y1,x2);Ixy(y2,x1) Ixy(y2,x2)];
    aux4 = aux4';
    I = [aux1 aux3;aux2 aux4];
    % TODO: Calculeaz? matricea final?.
    B = double(B);
    C = double(C);
    I = double(I);
    A = B*I*C;
endfunction