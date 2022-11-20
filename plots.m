
% Read in data
M = readmatrix(" enter-your-own-directory ");
set1 = [1:100]; set2 = [101:200]; set3 = [201:300];

% Each iteration separate into 10 blocks of 10, for config [1, 1], [1,2]... till [10,10]
% process in terms of each block

% training data
train1 = M(set1, 1);
train2 = M(set2, 1);
train3 = M(set3, 1);
trainSum = train1 + train2 + train3;
trainMean = trainSum / 3;

% validation data
valid1 = M(set1, 2);
valid2 = M(set2, 2);
valid3 = M(set3, 2);
validSum = valid1 + valid2 + valid3;
validMean = validSum / 3;

% test data
test1 = M(set1, 3);
test2 = M(set2, 3);
test3 = M(set3, 3);
testSum = test1 + test2 + test3;
testMean = testSum / 3;

%returns minimum mse value
minTrain = min(trainMean)
minValid = min(validMean)
minTest = min(testMean)



Xlabel = ('Number of nodes');
Title = ('Performance of 2-layer neural network');

% plots each individual set of training data
%{
figure
hold on
plot(test1);
plot(test2);
plot(test3);

legend('set1', 'set2', 'set3')
xlabel(Xlabel);
ylabel('MSE');
title(Title);
%}

% plots the average mse of training data
figure
plot(trainMean);
xlabel(Xlabel);
ylabel('Mean MSE (3 data sets)');
title(Title);

% plot the average MSE of training, valid and test onto one axis

figure
hold on
plot(trainMean);
plot(validMean);
plot(testMean);

legend('Training', 'Valid', 'Test')
xlabel(Xlabel);
ylabel('MSE');
title(Title);
%}

