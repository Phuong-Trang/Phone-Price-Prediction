test_data = readmatrix('E:\Octave\nhom10\data\test.csv');

r = ceil(rand*size(test_set,1));
phone_full = test_set(r,:); 
phone = test_data(r,1:(size(test_data,2)-1));
knn(test_data,phone,15)





