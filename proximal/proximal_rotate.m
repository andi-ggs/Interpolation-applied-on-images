function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);

    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif
    I = double(I);
    
    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].


    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);
    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    % TODO: Calculeaza matricea de transformare.
    TRANS_matrix = [c, -s; s, c];
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    TRANS_inv = inv(TRANS_matrix);
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            coords = TRANS_inv * [x; y];
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            coords = coords + [1; 1];
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            if coords(1) < 1 || coords(1) > n
                R(y+1, x+1) = 0;
                continue;
            endif
            if coords(2) < 1 || coords(2) > m
                R(y+1, x+1) = 0;
                continue;
            endif
            % TODO: Afla punctele ce înconjoara(xp, yp).
            x1 = floor(coords(1));
            x2 = ceil(coords(1));
            y1 = floor(coords(2));
            y2 = ceil(coords(2));
            if y2 > m && x2 > n
                y2 = y1;
                x2 = x1
            endif
            if y2 > m && x2 <= n
                y2 = y1;
                x2 = x2;
            endif
            if y2 <= m && x2 > n
              y2 = y2;
              x2 = x1;
            endif
            if y2 <= m && x2 <= n
              y2 = y2;
              x2 = x2;
            endif
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.
            a = proximal_coef(I, x1, y1, x2, y2);
            c1 = coords(1);
            c2 = coords(2);
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            R(y+1, x+1) = a(1) + a(2) * c1 + a(3) * c2 + a(4) * c1 * c2;
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction