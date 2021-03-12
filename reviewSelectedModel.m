% Task 2.7

% For the selected ‘best’ model - Model 3
% 1) estimate model parameters, use the training dataset; 
[Data] = readData();
[trainingSet, testingSet] = splitDataSet(Data);

onesTraining = ones(height(trainingSet), 1);
onesTesting = ones(height(testingSet), 1);

% Model 3
ModelData = [trainingSet.X2, trainingSet.X1 .^ 3, trainingSet.X3 .^ 4, onesTraining];
TestingSet = [testingSet.X2, testingSet.X1 .^ 3, testingSet.X3 .^ 4, onesTesting];

% 2) Compute the model’s output/prediction on the testing data
theta = estimateModelParamteters(ModelData, trainingSet.Y);
predictedY = predictY(TestingSet, theta);

% 3) Compute the 95% (model prediction) confidence intervals and plot them (with error bars) 
% together with the model prediction, as well as the testing data samples.
ci = calculateMarginOfError(predictedY);
plotPredictionsWithExpectations(predictedY, testingSet.Y, ci);


function [] = plotPredictionsWithExpectations(predictedY, expectedY, ci)
    numOfsamples = (1:length(expectedY))';
    onesTesting = ones(height(expectedY), 1);
    
    figure(1)
    eb = errorbar(predictedY, ci * onesTesting, 'o');
    eb.Color = '#f562ba';
    eb.LineWidth = 1;
    eb.MarkerSize = 8;
    
    hold on 
    sp = scatter(numOfsamples, expectedY, 'blue');
    sp.Marker = '*';

    grid on
    xlabel('Sample', 'FontSize', 12)
    ylabel('Output Signal (y)', 'FontSize', 12)
    legend({'Predicted output + Margin of Error','Expected output'})
    title("Model 3 - Output Signal Predicted vs Expected Values", 'FontSize', 14);
    xlim([0 41])
    ylim([-7 4])
end
