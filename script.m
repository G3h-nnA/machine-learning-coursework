%% multiple linear regression
% read in data
M = readmatrix('C:\Users\mpjw\OneDrive - Loughborough University\2_Lecture Notes\MATERIALS MODELLING\coursework\BulkModulus.csv', Range='B2');

% Seperate out the output and input data, ready for fitting
bulkMod = M(:,5); %k = bulk modulus, output parameters
InData = M(:,[1:4 6:7]); %extracts input parameters (everything except bulk mod)

% Split the data into training and test dataset
[train_idx, ~, test_idx] = dividerand(length(bulkMod), 0.7, 0, 0.3); %randomly split data into sets
bulkModTrain = bulkMod(train_idx);  %training output
bulkModTest = bulkMod(test_idx);    %test output
InDataTrain = InData(train_idx, :); %input data from training set
InDataTest = InData(test_idx, :);   %input data from test set

%%
% linear regression of the form y = a + sum_i mi*xi, switching linear to
% quadratic will change fitting complexity
mdl = fitlm(InDataTrain, bulkModTrain, 'quadratic');
mdl

% Do some things here to test the performance of your model on unseen data
% uses model to predict test data output
ypred = predict(mdl, InDataTest);

% calculates rmse and r2 of fit on test data
% r2 = 1 - (SSR)/(SST), SSR = sum(actual y value - predicted y value)^2, SST = sum(actual y value - mean of actual y values)^2
RMSE = sqrt(mean((bulkModTest - ypred).^2))
ymean = mean(bulkModTest);
r2 = 1 - (sum((bulkModTest - ypred).^2) / sum((bulkModTest - ymean).^2))

% plots graph of linear model prediction using test data
scatter(bulkModTest, ypred);
hold on
ylim = xlim;
plot(xlim, ylim);
legend('Predicted data', 'y = x');clear

xlabel('Test output')
ylabel('Model predicted output')

