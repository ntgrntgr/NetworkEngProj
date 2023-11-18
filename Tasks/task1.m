% MATLAB program to simulate and plot the average number of transmissions

% Parameters
N = 1000; % Number of simulations

% Values of K
K_values = [1, 5, 15, 50, 100];

% Generate p values
p_values = linspace(0, 0.9, 100); % 100 values between 0 and 1

% Initialize figure
figure;

% Loop over each K value
for k = 1:length(K_values)
    K = K_values(k);

    % Calculate results
    calculated_result = K ./ (1 - p_values);
    
    % Simulate results
    simulated_result = zeros(size(p_values));
    for i = 1:length(p_values)
        simulated_result(i) = runSingleLinkSim(K, p_values(i), N);
    end
    
    % Plot calculated results
    subplot(2, 3, k);
    semilogy(p_values, calculated_result, 'b-', 'LineWidth', 2);
    hold on;
    
    % Plot simulated results
    semilogy(p_values, simulated_result, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
    
    % Set plot labels and title
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    title(['K = ', num2str(K)]);
    
    % Add legend
    legend('Calculated', 'Simulated');
end

% Create a single figure with all K values
figure;
for k = 1:length(K_values)
    K = K_values(k);

    % Calculate results
    calculated_result = K ./ (1 - p_values);
    
    % Simulate results
    simulated_result = zeros(size(p_values));
    for i = 1:length(p_values)
        simulated_result(i) = runSingleLinkSim(K, p_values(i), N);
    end
    
    % Plot calculated results
    semilogy(p_values, calculated_result, 'LineWidth', 2);
    hold on;
    
    % Plot simulated results
    semilogy(p_values, simulated_result, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
end

% Set plot labels and title
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
title('Combined Results for Different K Values');

% Add legend
legend('Calculated (K=1)', 'Simulated (K=1)', 'Calculated (K=5)', 'Simulated (K=5)', ...
    'Calculated (K=15)', 'Simulated (K=15)', 'Calculated (K=50)', 'Simulated (K=50)', ...
    'Calculated (K=100)', 'Simulated (K=100)');