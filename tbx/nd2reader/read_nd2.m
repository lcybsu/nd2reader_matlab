% nd2reader interface

dirIn = "C:\Users\cnl29\Downloads\project\zplane_AI\dataset\20MAY22\";
dirOut = "C:\Users\cnl29\Downloads\project\zplane_AI\dataset\20MAY22_nikon_tif\";
mkdir(dirOut);

nd2files_dir = dir2(dirIn);

% Iterate through each nd2 file in the directory
for i =1:length(nd2files_dir)
       nd2file = ND2reader(char(fullfile(dirIn,nd2files_dir(i).name)));
       % Iterate through series in one nd2 file
       for k = 1:nd2file.sizeXY
           % Iterate through Z stacks 
            for j = 1:nd2file.sizeZ
                I = getImage(nd2file,j,1,k);
                savePath = fullfile(dirOut,strcat(extractBefore(nd2files_dir(i).name,'.'),'_series_',num2str(k,'%02.f'),'_z_',num2str(j,'%04.f'),'.tif'));
                % Transpose the image as needed
                imwrite(I',savePath);
            end 
       end
end