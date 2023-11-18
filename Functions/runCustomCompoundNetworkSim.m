function transmissions = runCustomCompoundNetworkSim(K, probabilities, iterations)
    % Simulate the number of transmissions required for a compound network
    % with K packets and different failure probabilities for each link
    
    transmissions = zeros(iterations, 1);
    
    for i = 1:iterations
        success = false;
        numTransmissions = 0;
        
        while ~success
            numTransmissions = numTransmissions + 1;
            
            % Simulate each link independently with specific probabilities
            outcomes = rand(1, K) > probabilities;
            
            % Check if at least one link successfully transmits the packet
            success = any(outcomes);
        end
        
        transmissions(i) = numTransmissions;
    end
end