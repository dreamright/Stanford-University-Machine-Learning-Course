function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);
X = [ones(size(X,1),1) X];
% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
[h,p] = max(sigmoid([ones(size(X*Theta1',1),1) sigmoid(X*Theta1')]*...
                        (Theta2)'),[],2);
%Vrkatce: 
    %1) X * (Theta1)' = m x s2: [a^1_0 a^1_1 a^1_2 ... -- dlya x^(1);...
        %analogichno dlya x^2; x^3...]
    %2) Dobavlyaem edinichniy stolbec v (1), obernutiy v sigmoid;
    %3) Umnozhatm (2) na (Theta2)' -- poluchaem [a^2_0 a^2_1 a^2_2...]
    %4) Nahodim max po strochke v obernutoi v sigmoid funkcii.
    %Resultat -- p = m x s3 = [predskazanie dlya pervogo nabora dannih; dlya
    %vtorogo;...]. h ne ispolzuetsya.
    % =========================================================================


end
