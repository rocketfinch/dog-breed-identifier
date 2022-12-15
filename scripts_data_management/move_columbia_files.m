clear;
stanford_folder = pwd + "/test/";
s_files = dir(stanford_folder);
s_directories_flagged = [s_files.isdir];
s_subfolders = s_files(s_directories_flagged);
s_subfolder_names = {s_subfolders(3:end).name};

columbia_folder = "~/CS5330/datasets/columbia/dogImages/test/";
c_files = dir(columbia_folder);
c_directories_flagged = [c_files.isdir];
c_subfolders = c_files(c_directories_flagged);
c_subfolder_names = {c_subfolders(3:end).name};

in_stanford_not_in_columbia = setdiff(s_subfolder_names, c_subfolder_names);
in_stanford_not_in_columbia = in_stanford_not_in_columbia(:);

in_columbia_not_in_stanford = setdiff(c_subfolder_names, s_subfolder_names);
in_columbia_not_in_stanford = in_columbia_not_in_stanford(:);

current_folder = pwd;
save('in_stanford_not_in_columbia_test.mat', 'in_stanford_not_in_columbia');
writecell(in_stanford_not_in_columbia, 'in_stanford_not_in_columbia_test.csv')
for iSubfolder = 1:length(c_subfolder_names)
    subfolder = c_subfolder_names(iSubfolder);
    if isfolder(stanford_folder + subfolder)
        movefile(columbia_folder + subfolder + "/*", stanford_folder + subfolder)
    end
end
