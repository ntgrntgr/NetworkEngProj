% Set parameters
K_values = [1, 5, 15, 50, 100];
iterations = 1000;

% Generate plots for each K value
figure('Name', 'Individual Simulations');
for k = 1:length(K_values)
    K = K_values(k);
    
    % Perform simulations for every possible value of p
    for p = 0.01:0.01:0.99
        transmissions = runCompoundNetworkSim(K, p, iterations);
        semilogx(p, mean(transmissions), 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'none');
        hold on;
    end
end

title('Individual Simulations');
xlabel('Probability (p)');
ylabel('Average Number of Transmissions');
legend(arrayfun(@(k) sprintf('K=%d', k), K_values, 'UniformOutput', false));
hold off;

% Generate a single plot with all K values
figure('Name', 'Combined Simulations');
for k = 1:length(K_values)
    K = K_values(k);
    transmissions = zeros(1, length(0.01:0.01:0.99));
    
    % Perform simulations for every possible value of p
    for idx = 1:length(transmissions)
        p = 0.01 + (idx - 1) * 0.01;
        transmissions(idx) = mean(runCompoundNetworkSim(K, p, iterations));
    end
    
    semilogx(0.01:0.01:0.99, transmissions, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'none');
    hold on;
end

title('Combined Simulations');
xlabel('Probability (p)');
ylabel('Average Number of Transmissions');
legend(arrayfun(@(k) sprintf('K=%d', k), K_values, 'UniformOutput', false));
hold off;