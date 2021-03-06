function [u,v,t] = osc_FE(X_0, omega, dt, T)

    N_t = floor(round(T/dt));
    t = linspace(0, N_t*dt, N_t+1);
    u = zeros(N_t+1, 1);
    v = zeros(N_t+1, 1);
    
    %Initial condition
    u(1) = X_0;
    v(1) = 0;

    % Step equations forward in time
    for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
    end
end