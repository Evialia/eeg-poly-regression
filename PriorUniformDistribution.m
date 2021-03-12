% Uniform probability function

[Data] = readData();
[trainingSet, testingSet] = splitDataSet(Data);

onesTraining = ones(height(trainingSet), 1);
onesTesting = ones(height(testingSet), 1);
ModelData = [trainingSet.X2, trainingSet.X1 .^ 3, trainingSet.X3 .^ 4, onesTraining];
theta = estimateModelParamteters(ModelData, trainingSet.Y);

theta1Hi = theta(1) + theta(1) * 0.2;
theta1Lo = theta(1) - theta(1) * 0.2;

theta2Hi = theta(4) + theta(4) * 0.2;
theta2Lo = theta(4) - theta(4) * 0.2;

pd1 = makedist('Uniform','lower',theta1Lo ,'upper',theta1Hi); 
pd2 = makedist('Uniform','lower',theta2Lo ,'upper',theta2Hi); 

x = 0:.0001:0.55;
pdf1 = pdf(pd1,x);
pdf2 = pdf(pd2,x);
plot(x,pdf1,'LineWidth',2, 'Color', '#f562ba')

hold on 
plot(x,pdf2,'b','LineWidth',2)

grid on
xlabel('Possible Parameter Values (theta)', 'FontSize', 12)
ylabel('Probability Density', 'FontSize', 12)
legend1 = ['Parameter 1: ', num2str(theta(1)) , ' +/- 20%'];
legend2 = ['Parameter 4: ', num2str(theta(4)) , ' +/- 20%'];
legend({legend1, legend2})
[t, s] = title('Uniform Prior Distributions', 'Model 3');
t.FontSize = 14;
s.FontAngle = 'italic';
