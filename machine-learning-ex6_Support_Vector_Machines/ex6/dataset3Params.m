function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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
cvec = 0.01;
while cvec(end) <= 30
    cvec_t = cvec(end);
    cvec = [cvec; cvec_t*2];
end

sigvec = 0.01;
while sigvec(end) <= 30
    sigvec_t = sigvec(end);
    sigvec = [sigvec; sigvec_t*2];
end

c_opt = cvec(1);
sig_opt = sigvec(1);
model = svmTrain(X, y, c_opt, @(x1, x2) gaussianKernel(x1, x2, sig_opt));
preds = svmPredict(model, Xval);
error = mean(double(preds ~= yval));

for i = 1:length(cvec)
    for j = 1:length(sigvec)
        model= svmTrain(X, y, cvec(i), @(x1, x2)...
                gaussianKernel(x1, x2, sigvec(j)));
        preds = svmPredict(model, Xval);
        if mean(double(preds ~= yval)) <= error
            error = mean(double(preds ~= yval));
            c_opt = cvec(i);
            sig_opt = sigvec(j);
        end
    end
end
C = c_opt;
sigma = sig_opt;
% =========================================================================

end
