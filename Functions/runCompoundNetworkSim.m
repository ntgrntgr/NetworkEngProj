function transmissions = runCompoundNetworkSim(K, p, iterations)
    % Simulate the number of transmissions required for a compound network
    % with K packets and probability p for each link
    
    transmissions = zeros(iterations, 1);
    
    for i = 1:iterations
        success = false;
        numTransmissions = 0;
        
        while ~success
            numTransmissions = numTransmissions + 1;
            
            % Simulate each link independently
            outcomes_A = rand(1, K) > p;
            outcomes_B = rand(1, K) > p;
            outcomes_C = rand(1, K) > p;
            
            % Check if at least one link successfully transmits the packet
            success = any(outcomes_A & outcomes_B) || any(outcomes_C);
        end
        
        transmissions(i) = numTransmissions;
    end
end