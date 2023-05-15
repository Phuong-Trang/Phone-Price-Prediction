function [train, validation, test] = divData(data)
  trainR = 1; validationR = 1; testR = 1;
  for x = 1:size(data,1)
    phone = data(x,:);
    if (mod(x,5) == 1)
      test(testR,:) = phone;
      testR = testR + 1;
    elseif (mod(x,5) == 2)
      validation(validationR,:) = phone;
      validationR = validationR + 1;
    else
      train(trainR,:) = phone;
      trainR = trainR + 1;
    end
  end
end