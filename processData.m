%LOADING DATA FROM FILE
data = readmatrix('data.csv');
data(:,[1,2,3,4,9,14,15]) = [];

%ADDING CLASSSIFICATION COLUMN (by price on 2022)
% 1 - cao cap (>14tr), 2 - trung binh (>6tr), 3 - binh dan
class = rand(size(data,1),1);
for x = 1:size(data,1)
  price22 = data(x,size(data,2));
  if (price22 > 1.4e+7)
    class(x,1) = 1;
  elseif (price22 > 0.6e+7)
    class(x,1) = 2;
  else
    class(x,1) = 3;
  end
end
data = [data class];

%DIVIDE DATASET INTO TRAIN, VALIDATION, TEST SETS
data = sortrows(data, size(data,2) - 1, 'descend');
[train, validation, test] = divData(data);

%EXPORT FILES
csvwrite("train.csv", train)
csvwrite("validation.csv", validation)
csvwrite("test.csv", test)