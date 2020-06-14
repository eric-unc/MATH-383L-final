function [t, yAprx] = AdamsBashforth4(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yAprx = zeros(1, N + 1);
    
    h = (tf - t0)/(N+1);
    
    % This is 4-step, so we need the first 4 points, using forward euler
    [~, yInit] = ForwardEuler(f, y0, t0, t(4), 4 - 1);
    
    for n = 1:4
        yAprx(n) = yInit(n);
    end
    
    % Calculation of the rest
    for n = 4:N
        p1 = (55/24)*h*f(t(n), yAprx(n));
        p2 = (59/24)*h*f(t(n - 1), yAprx(n - 1));
        p3 = (37/24)*h*f(t(n - 2), yAprx(n - 2));
        p4 = (9/24)*h*f(t(n - 3), yAprx(n - 3));
        yAprx(n + 1) = yAprx(n) + p1 - p2 + p3 - p4;
    end
end