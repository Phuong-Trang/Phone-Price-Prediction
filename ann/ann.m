train_set = csvread('E:\Octave\nhom10\data\train.csv');
validate_set = csvread('E:\Octave\nhom10\data\validation.csv');
test_set = csvread('E:\Octave\nhom10\data\test.csv');
train_input = [train_set(:,1:8)', validate_set(:,1:8)'];% test_set(:,1:8)'];
train_target = [train_set(:,9)', validate_set(:,9)'];% test_set(:,9)'];

net = newff(minmax(train_input), [8,12,1], {'logsig', 'tansig', 'purelin'}, 'trainlm');
net = init(net);
net.trainParam.show = 1;
net.trainParam.epochs = 50;
net.trainParam.goal = 1e-12;
net = train(net, train_input, train_target);

%phone_full = validate_set(1,:); 
%phone = test_set(1,1:(size(validate_set,2)-9))';
%sim(net,phone)