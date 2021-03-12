% Scatter plots
function [] = drawScatterPlots(Data)
    drawScatterPlot(1, Data.X1, Data.Y);
    drawScatterPlot(2, Data.X2, Data.Y);
    drawScatterPlot(3, Data.X3, Data.Y);
    drawScatterPlot(4, Data.X4, Data.Y);
end

function [] = drawScatterPlot(position, dataX, dataY)
    figure(3)
    subplot(2, 2, position)
    scatter(dataX, dataY, 60, 'MarkerEdgeColor', '#f562ba');
    
    ylim([-10 10])
    xlim([-10 10])
    grid on
    
    hold on 
    [slope] = plotBestFitLine(dataX, dataY);
    hold off
    
    title({['{\bf\fontsize{14} Relationship of x_{', num2str(position), '} and y}']},...
           ['Line of  best fit slope = ', num2str(slope)]);
    xlabel(['Input EEG Signals (x_{', num2str(position), '})'], 'FontSize', 12)
    ylabel('Output EEG Signals (y)', 'FontSize', 12)
end

function [slope] = plotBestFitLine(dataX, dataY)
    correlationLineFit = fit(dataX, dataY, "poly1");
    plot(correlationLineFit, "Blue")
    slope = correlationLineFit.p1;
    legend('Data', 'Line of best fit')
end