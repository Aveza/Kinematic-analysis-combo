function SIR_dt()
    function result = f(u,t)
        beta = 10/(40*8*24);
        gamma = 3/(15*24);
        
        S = u(1); I = u(2); R = u(3);
        result = [-beta*S*I beta*S*I - gamma*I gamma*I];
    end
    
    dt = 30;   % 30 h
    D = 30;      % Simulate for D days
    N_t = floor(D*24/dt);    % Corresponding no of hours
    T = dt*N_t;              % End time
    U_0 = [50 1 0];
    
    f_handle = @f; %function handle
    [u, t] = ode_FE(f_handle, U_0, dt, T); %Calling ode_FE
    
    S_old = u(:,1);
    I_old = u(:,2);
    R_old = u(:,3);
    
    k = 1;
    answer = 'Y'; %basically same while loop as in 4.1 with addition of SIR
    while answer == 'Y';
        dt_k = 2^(-k)*dt;
        [u_new, t_new] = ode_FE(f_handle, U_0, dt_k, T); %calling ode_FE with halved time step thus generating new values
        S_new = u_new(:,1);
        I_new = u_new(:,2);
        R_new = u_new(:,3);
        
        plot(t, S_old, 'b-', t_new, S_new, 'b--',t, I_old, 'r-', t_new, I_new, 'r--',t, R_old, 'g-', t_new, R_new, 'g--')
        legend('S old', 'S new','I old', 'I new','R old', 'R new')
        xlabel('hours'); 
        fprintf('Time step: %g\n', dt_k);
        answer = input('Continue with halved time step? (Y/N) ','s');
        if answer == 'Y' %replaces old values with new ones if continued
            S_old = S_new;
            R_old = R_new;
            I_old = I_new;
            t = t_new; 
        else
            break
        end
        k = k + 1;
    end
end

