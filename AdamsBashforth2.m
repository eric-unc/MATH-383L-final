function [t, yAprx] = AdamsBashforth2(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yAprx = zeros(1, N + 1);
    
    h = (tf - t0)/(N+1);
    
    % This is 2-step, so we require the first two points
    yAprx(1) = y0;
    yAprx(2) = y0 + h*f(1, y0);
    
    for n = 2:N
        yAprx(n + 1) = yAprx(n) + (3/2)*h*f(t(n), yAprx(n)) - (1/2)*h*f(t(n - 1), yAprx(n - 1));
    end
end