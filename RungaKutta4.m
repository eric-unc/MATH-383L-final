function [t, yAprx] = RungaKutta4(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yAprx = zeros(1, N + 1);
    yAprx(1) = y0;
    
    h = (tf - t0)/(N+1);
    
    for n = 1:N
        Y1 = yAprx(n);
        Y2 = yAprx(n) + (h/2)*f(t(n), Y1);
        Y3 = yAprx(n) + (h/2)*f(t(n) + (h/2), Y2);
        Y4 = yAprx(n) + h*f(t(n) + (h/2), Y3);
        yAprx(n + 1) = yAprx(n) + (h/6)*(f(t(n), Y1) + 2*f(t(n) + (h/2), Y2) + 2*f(t(n) + (h/2), Y3) + f(t(n) - h, Y4));
    end
end