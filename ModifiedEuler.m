function [t, yApprox] = ModifiedEuler(f, y0, t0, tf, N)
    t = linspace(t0, tf, N + 1);
    yApprox = zeros(1, N + 1);
    yApprox(1) = y0;
    
    h = (tf - t0)/(N+1);
    
    for n = 1:N
        %yTilde = yApprox(n) + h*f(n, yApprox(n));
        %yApprox(n + 1) = yApprox(n) + (h / 2)*(f(n, yApprox(n)) + f(n, yTilde));
        yTilde = yApprox(n) + h*f(t(n), yApprox(n));
        yApprox(n + 1) = yApprox(n) + (h / 2)*(f(t(n), yApprox(n)) + f(t(n), yTilde));
    end
end