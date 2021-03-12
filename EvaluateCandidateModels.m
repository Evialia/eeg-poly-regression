[Data] = readData();
[trainingSet] = splitDataSet(Data);

% Additonal model specific features
X1Squared = trainingSet.X1 .^ 2;
X1Cubed = trainingSet.X1 .^ 3;
X1PowerOf4 = trainingSet.X1 .^ 4;
X3PowerOf4 = trainingSet.X3 .^ 4;
X3Cubed = trainingSet.X3 .^ 3;
ones = ones(height(trainingSet), 1);

% Model 1 = theta(1) * Data.X4 + theta(2) * X1Squared + theta(3) * X1Cubed + theta(4) * X3PowerOf4 + theta(5);
ModelData1 = [trainingSet.X4, X1Squared, X1Cubed, X3PowerOf4, ones];
[modelStats1, err] = evaluateModel(ModelData1, trainingSet.Y);
drawQQPlot(err, 1)

% Model 2 = theta(1) * X3Cubed + theta(2) * X3PowerOf4 + theta(3);
ModelData2 = [X3Cubed, X3PowerOf4, ones];
[modelStats2, err] = evaluateModel(ModelData2, trainingSet.Y);
drawQQPlot(err, 2)

% Model 3 = theta(1) * X2 + theta(2) * X1Cubed + theta(3) * X3PowerOf4 + theta(4);
ModelData3 = [trainingSet.X2, X1Cubed, X3PowerOf4, ones];
[modelStats3, err] = evaluateModel(ModelData3, trainingSet.Y);
drawQQPlot(err, 3)

% Model 4 = theta(1) * X4 + theta(2) * X1Cubed + theta(3) * X3PowerOf4 + theta(4);
ModelData4 = [ones, trainingSet.X4, X1Cubed, X3PowerOf4];
[modelStats4, err] = evaluateModel(ModelData4, trainingSet.Y);
drawQQPlot(err, 4)

% Model 5 = theta(1) * X4 + theta(2) * X1Cubed + theta(3) * X3PowerOf4 + theta(4);
ModelData5 = [ones, trainingSet.X4, X1Squared, X1Cubed, X3PowerOf4, X1PowerOf4];
[modelStats5, err] = evaluateModel(ModelData5, trainingSet.Y);
drawQQPlot(err, 5)


function [] = drawQQPlot(residuals, no)
    figure(1)
    subplot(2, 3, no)
    
    qq = qqplot(residuals);
    qq(3).Color = 'blue';
    set(qq(1),'marker','o','markeredgecolor', '#f562ba');
    
    [t] = title(['Q-Q plot of Model ', num2str(no)]);
    t.FontSize = 14;
    
    grid on
end