function [t, y] = solution(N)
    t = linspace(0, N, N + 1);
    y = zeros(1, N + 1);
    
    for n = 1:(N + 1)
        y(n) = -18.7*exp(-0.0187*t(n)) + 298;
    end
end
