
    % Main program
    
    % Parameters
    K_values = [1, 5, 10];
    iterations = 1000;
    
    % Table of different failure probability scenarios
    scenarios = [
        0.1, 0.6, 0.01;
        0.6, 0.1, 0.01;
        0.1, 0.01, 0.99;
        0.6, 0.01, 0.99;
        0.01, 0.99, 0.1;
        0.01, 0.99, 0.6
    ];
    
    % Plot results for each scenario
    for s = 1:size(scenarios, 1)
        probabilities = scenarios(s, :);
        
        figure;
        
        for k = 1:length(K_values)
            K = K_values(k);
            transmissions = runCustomCompoundNetworkSim(K, probabilities, iterations);
            
            subplot(1, length(K_values), k);
            histogram(transmissions, 'BinMethod', 'integers', 'Normalization', 'probability');
            title(['K = ' num2str(K)]);
            xlabel('Number of Transmissions');
            ylabel('Probability');
            grid on;
            set(gca, 'XScale', 'log');
        end
        
        suptitle(['Probability Scenario ' num2str(s)]);
    end
