% Time Series Plotsof: EEG Signal Readings Over Time
function [] = drawTimeSeriesPlots(Data)
    figure(1)
   
    drawTimeSeriesPlot(1, Data.Time, Data.X1, 'x1');
    drawTimeSeriesPlot(2, Data.Time, Data.X2, 'x2');
    drawTimeSeriesPlot(3, Data.Time, Data.X3, 'x3');
    drawTimeSeriesPlot(4, Data.Time, Data.X4, 'x4');
    drawTimeSeriesPlot(5, Data.Time, Data.Y, 'y');
    
    xlabel('Sampling Time of EEG Signals (sec)')
    
    figure(2)
    pspectrum(Data.X1, "FrequencyLimits",[0 1])
    
    figure(3)
    lowpass(Data.X1,0.11)
    
end

function [] = drawTimeSeriesPlot(position, timeData, signalData, signalDataVarName)
    subplot(5,1, position)
    plot(timeData, signalData, '.-m','MarkerSize', 3)
    title(['EEG Signal Readings Over Time (', signalDataVarName, ')'], 'FontWeight', 'bold');
    legend(signalDataVarName)
    ylabel(['Input EEG Signals (', signalDataVarName, ')'])
    
    ylim([-10 10])
    grid on
end
