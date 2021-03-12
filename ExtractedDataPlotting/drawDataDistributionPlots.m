% Fit and Plot Standard Normal Distribution
function [] = drawDataDistributionPlots(Data)

plotProbabilityDensityFunction(1, Data.X1, 'x1');
plotProbabilityDensityFunction(2, Data.X2, 'x2');
plotProbabilityDensityFunction(3, Data.X3, 'x3');
plotProbabilityDensityFunction(4, Data.X4, 'x4');
plotProbabilityDensityFunction(5, Data.Y, 'y');

end

function [] = plotProbabilityDensityFunction(position, data, dataVarName)
    % Calculate the normal pdf
    meanData = mean(data);
    stdData = std(data);
    amplitude = linspace(-10, 10);
    
    pdfData = normpdf(amplitude, meanData, stdData);
    
    % Visualize the probability density function with the 
    % discrete pdf of the data.
    figure(2)
    subplot(2, 3, position)
    plot(amplitude, pdfData);
    [t,s] = title(['Standard Normal Distribution (', dataVarName, ')'],['μ = ', num2str(meanData), '  σ = ', num2str(stdData)]);
    t.FontSize = 14;
    s.FontAngle = 'italic';
    
    hold on
    h = histogram(data, 40, "Normalization", "pdf");
    h.FaceColor = '#f562ba';
    ylim([0 0.5])
    hold off
    
    grid on
    xlabel('Amplitude', 'FontSize', 12)
    ylabel('Probability Density', 'FontSize', 12)
end