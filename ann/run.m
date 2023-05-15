%set training dataset folder
train_data = fullfile('E:\Octave\nhom10\data\train.csv');

%training set
imdsTrain = imageDatastore(train_data, ...
'IncludeSubfolders',true,'LabelSource','foldernames');

%set validation dataset folder
validationPath = fullfile('E:\Octave\nhom10\data\validation.csv');

%testing set
imdsValidation = imageDatastore(validationPath, ...
'IncludeSubfolders',true,'LabelSource','foldernames');

%create a clipped ReLu layer
layer = clippedReluLayer(10,'Name','clip1');

% define network architecture
layers = [
imageInputLayer([256 256 1]);

% conv_1
convolution2dLayer(3,32,'Stride',1)
batchNormalizationLayer
clippedReluLayer(10);
maxPooling2dLayer(2,'Stride',2)

%fc
fullyConnectedLayer(100)
dropoutLayer(0.7,'Name','drop1');

%fc
fullyConnectedLayer(25)
dropoutLayer(0.8,'Name','drop2'); 

% fc layer
fullyConnectedLayer(2)
softmaxLayer
classificationLayer];

% specify training option
options = trainingOptions('adam', ...
'InitialLearnRate',0.001, ...
'MaxEpochs',15, ...
'Shuffle','every-epoch', ...
'ValidationData',imdsValidation, ...
'ValidationFrequency',30, ...
'Verbose',false, ...
'Plots','training-progress');

% train network using training data
net = trainNetwork(imdsTrain,layers,options);

% classify validation images and compute accuracy
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

%calculate accuracy
accuracy = sum(YPred == YValidation)/numel(YValidation);