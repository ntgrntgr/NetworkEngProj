% MATLAB program to simulate and plot the average number of transmissions
% for a network with two parallel links

% Parameters
N = 1000; % Number of simulations

% Values of K
K_values = [1, 5, 15, 50, 100];

% Generate p values
p_values = linspace(0, 0.99, 100); % 100 values between 0 and 1

% Initialize figure
figure;

% Loop over each K value
for k = 1:length(K_values)
    K = K_values(k);
    
    % Simulate results using runTwoParallelLinkSim function
    simulated_result = zeros(size(p_values));
    for i = 1:length(p_values)
        simulated_result(i) = runTwoParallelLinkSim(K, p_values(i), N);
    end
    
    % Plot simulated results
    subplot(2, 3, k);
    semilogy(p_values, simulated_result, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
    
    % Set plot labels and title
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    title(['K = ', num2str(K)]);
end

% Create a single figure with all K values
figure;
for k = 1:length(K_values)
    K = K_values(k);
    
    % Simulate results using runTwoParallelLinkSim function
    simulated_result = zeros(size(p_values));
    for i = 1:length(p_values)
        simulated_result(i) = runTwoParallelLinkSim(K, p_values(i), N);
    end
    
    % Plot simulated results
    semilogy(p_values, simulated_result, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 6);
    hold on;
end

% Set plot labels and title
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
title('Simulated Results for Different K Values (Two Parallel Links)');

% Add legend
legend('K=1', 'K=5', 'K=15', 'K=50', 'K=100');