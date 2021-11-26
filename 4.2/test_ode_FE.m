function test_ode_FE()
    test_ode_FE_1
end

function test_ode_FE_1
    hand = [1 2 4 8]; %hand calculated values in 4.1
    %Initial values for ode_FE
    U_0 = 1;
    dt = 1; 
    T = 3; 
    
    function result = f(u,t);
        result = u;
    end

    [u,t] = ode_FE(@f, U_0, dt, T) %calls ode_FE
    
    tol = 1E-14; %tolerance for error
    for i = 1:length(hand)
    err = abs(hand(i) - u(i)); %error between hand and ode_FE calculation, in this case = 0
    assert(err < tol, 'i = %d, err = %g', i, err);
    end
end