function [t, yApprox] = MidpointEuler(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yApprox = zeros(1, N + 1);
    yApprox(1) = y0;
    
    h = (tf - t0)/(N+1);
    
    for n = 1:N
        p1 = t(n) + (h/2);
        p2 = yApprox(n) +(h/2)*f(t(n), yApprox(n));
        yApprox(n + 1) = yApprox(n) + h*f(p1, p2);
    end
end