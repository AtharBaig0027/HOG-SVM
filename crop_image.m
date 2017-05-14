function crop_image(path)
% CROP_IMAGES crops the raw images into the image of dimention 64X128.
%             This function can read file of format jpg, png and ppm.
%             
% INPUT:  
%       paths: paths where raw images are located
%
%       writes the cropped image in folder cropped located in the input
%       directory and in jpg format and 
%$ Author: Mirza Athar Baig $
%$ Date  :5/14/2017
IMG_WILDCARDS = {'*.jpg','*.png','*.ppm'};


    %% path stuff
    if nargin < 1
        images_path = uigetdir('.images','Select image folder');
        
        if isa(images_path,'double')
          
            cprintf('Errors','Invalid paths...\nexiting...\n\n')
            return 
        end
        
    else
        images_path = path;
       
    end

%   creating directory for the output images

     new_path=strcat(images_path,'\cropped'); 
     mkdir(new_path);
    
    %% getting  images and count
    in_images = [];
    
    for i=1:numel(IMG_WILDCARDS)
        wildcard = strcat(in_images_path,filesep,IMG_WILDCARDS{i});
        in_images = [in_images; rdir(wildcard)];
        
    end
    % reading images and cropping in the size of 64X128
    for k=1: size(in_images,1)
        
       temp=imread(in_images(k).name);
       [r,c,~]=size(temp);
       row_start=(r-128)/2+1 ;
       row_end=r-(r-128)/2 ; 
       col_start=(c-64)/2+1 ;
       col_end=c-(c-64)/2 ; 
       I2=temp(row_start:row_end, col_start:col_end,:);
       baseFileName = sprintf('%d.jpg', k); % e.g. "1.png"
       fullFileName = fullfile(new_path, baseFileName); % No need to worry about slashes now!
       imwrite(I2, fullFileName);
       imshow(I2)
        
    end

    
end
