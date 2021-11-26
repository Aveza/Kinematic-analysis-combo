function osc_FE_func()
    %Initial values
    X_0 = 2;
    omega = 2;
    P = 2*pi/omega;
    dt = P/20;
    T = 3*P;
    
    [u, v, t] = osc_FE(X_0, omega, dt, T); %calls the osc_FE function
    
    plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
    legend('numerical', 'exact', 'Location','northwest');
    xlabel('t');
end

%only change was to modify the Forward_Euler.m in a way
%that the numerical solutions are solved in its own function file and it is
%called in this file.