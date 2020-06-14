function [t, yApprox] = BackwardEuler(f, y0, t0, tf, N)
    clear y_np1
    syms y_np1

    t = linspace(t0, tf, N + 1);
    yApprox = zeros(1, N + 1);
    yApprox(1) = y0;
    
    dt = (tf - t0)/(N+1);
    
    for n = 1:N
        solutions = solve(y_np1 == yApprox(n) + dt*f(t(n + 1), y_np1));
        
        yResult = 0;
        
        for possibleResult = solutions
            if isreal(possibleResult)
                yResult = possibleResult(2);
                break;
            end
        end
        
        yApprox(n + 1) = yResult;
    end
end