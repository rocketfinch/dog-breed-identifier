clear;
test_folder = pwd + "/test/";
train_folder = pwd + "/train/";

train_files = dir(train_folder);
train_directories_flagged = [train_files.isdir];
train_subfolders = train_files(train_directories_flagged);
train_subfolder_names = {train_subfolders(3:end).name};

% for isubfolder = 1:length(train_subfolder_names)
%     subfiles1 = dir(test_folder + train_subfolder_names(isubfolder));
%     subdirFlags1 = [subfiles1.isdir];
%     subsubfolders1 = subfiles1(subdirFlags1);
%     if not(isempty(subsubfolders1))
%         disp(test_folder + isubfolder)
%     end
% end

test_files = dir(test_folder);
test_directories_flagged = [test_files.isdir];
test_subfolders = test_files(test_directories_flagged);
test_subfolder_names = {test_subfolders(3:end).name};

% for isubfolder = 1:length(test_subfolder_names)
%     subfiles2 = dir(test_folder + test_subfolder_names(isubfolder));
%     subdirFlags2 = [subfiles2.isdir];
%     subsubfolders2 = subfiles2(subdirFlags2);
%     if not(isempty(subsubfolders2))
%         disp(test_folder + isubfolder)
%     end
% end

intrain = setdiff(train_subfolder_names, test_subfolder_names);
intest = setdiff(test_subfolder_names, train_subfolder_names);
inboth = intersect(train_subfolder_names, test_subfolder_names);



writecell(inboth(:), "breedlist.csv")