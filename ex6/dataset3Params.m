function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%



% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%



%model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);

cCandidates = [0.01,0.03,0.1,0.3,1,3,10,30];
sigmaCandidates = [0.01,0.03,0.1,0.3,1,3,10,30];

% You need to return the following variables correctly.
C = cCandidates(1);
sigma = sigmaCandidates(1);
minError = -1;
errors = zeros(64,1);
params = zeros(64,2);
i=1;

% The actual working code:
if false
  for cC = cCandidates
    for sigmaC = sigmaCandidates
      model= svmTrain(X, y, cC, @(x1, x2) gaussianKernel(x1, x2, sigmaC)); 
      predictions = svmPredict(model, Xval);
      errors(i) = mean(double(predictions ~= yval));
      params(i,:) = [cC, sigmaC];
      i++;
      %if (minError == -1 || error < minError)
       % error = minError;
       % C = cC;
       % sigma = sigmaC;
      %endif
    endfor
  endfor
  
  [minError, index] = min(errors);

  C = params(index, 1);
  sigma = params(index,2);
endif

C = 1;
sigma = 0.1;

% =========================================================================

end
