

% read in data
M = readmatrix(" enter-your-directory\BulkModulus.csv", Range="B2");

% Seperate out the output and input data, ready for fitting
bulkMod = M(:,5); % k = bulk modulus, output parameters
InData = M(:,[1:4 6:7]); % extracts input parameters (everything except bulk mod)
trainIn = transpose(InData);
trainOut = transpose(bulkMod);
fileID = fopen('temp.txt','a'); % open file for recording data

% 1 layer loop [1]-[25]
%{
for i = 1:1:25
    net = fitnet([i]);
    [net,tr] = train(net, trainIn, trainOut);
    fprintf(fileID, '%d, %d, %d \n', [tr.best_perf], [tr.best_vperf], [tr.best_tperf]);
end
%}

% 2 layer loop [1,1] - [10,10]
%{
fprintf(fileID, '\n');
for i = 1:1:10
    for j = 1:1:10
        net = fitnet([i,j]);
        [net,tr] = train(net, trainIn, trainOut);
        fprintf(fileID, '%d, %d, %d \n', [tr.best_perf], [tr.best_vperf], [tr.best_tperf]);
    end
end
%}

% 3 layer loop [1,1,1]-[10,10,10]
fprintf(fileID, 'Three-layer config');
for i = 1:1:5
    for j = 1:1:5
         for k = 1:1:5
            net = fitnet([i,j,k]);
            [net,tr] = train(net, trainIn, trainOut);
            fprintf(fileID, '%d, %d, %d \n', [tr.best_perf], [tr.best_vperf], [tr.best_tperf]);
        end
    end
end



fclose(fileID);
