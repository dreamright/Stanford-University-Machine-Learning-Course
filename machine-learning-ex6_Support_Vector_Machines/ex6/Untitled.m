file_contents = readFile(dir_files(1).name);
word_indices  = processEmail(file_contents);

dir_files_eh = dir 'D:\Dropbox\ML_coursera_standford\Exercises\machine-learning-ex6\corpus\easy_ham';
dir_files_eh2 = dir 'D:\Dropbox\ML_coursera_standford\Exercises\machine-learning-ex6\corpus\easy_ham_2';
dir_files_hh = dir 'D:\Dropbox\ML_coursera_standford\Exercises\machine-learning-ex6\corpus\hard_ham';
dir_files_spam = dir 'D:\Dropbox\ML_coursera_standford\Exercises\machine-learning-ex6\corpus\spam';
dir_files_spam2 = dir 'D:\Dropbox\ML_coursera_standford\Exercises\machine-learning-ex6\corpus\spam_2';




