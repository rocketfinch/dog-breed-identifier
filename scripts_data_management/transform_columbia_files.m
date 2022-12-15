clear;
current_folder = pwd + "/dogImages/valid/";
files = dir(current_folder);
directories_flagged = [files.isdir];
subfolders = files(directories_flagged);
subfolder_names = {subfolders(3:end).name};

for iFolder = 1:length(subfolder_names)
    subfolder_name = subfolder_names(iFolder);
    subfolder_path = current_folder + subfolder_name;

    new_subfolder_name = lower(string(extractAfter(subfolder_name, ".")));
    new_subfolder_path = current_folder + new_subfolder_name;
    movefile(subfolder_path,new_subfolder_path)
end