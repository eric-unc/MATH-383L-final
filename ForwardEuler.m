function [t, yApprox] = ForwardEuler(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yApprox = zeros(1, N + 1);
    yApprox(1) = y0;
    
    dt = (tf - t0)/(N+1);
    
    for n = 2:(N + 1)
        yApprox(n) = yApprox(n - 1) + dt*f(t(n), yApprox(n - 1));
    end
end