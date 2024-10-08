% https://github.com/jeonsworld/ViT-pytorch/utils/scheduler.py

% Define the parent directory
parentDir = '/Invariant_Feature/data/brain-mri-jpg';

% Get a list of all folders in the parent directory
items = dir(fullfile(parentDir));
croppedItems = items(startsWith({items.name}, '_t2'));

% Create the Excel file
filename = '/Invariant_Feature/GLCM_Invariant_Features.xlsx';

% Initialize the flag for writing headers
writeHeaders = true;

for i = 1:numel(croppedItems)
    itemName = croppedItems(i).name;
    newItemName = itemName(strfind(itemName, 'cropped-')+length('cropped-'):end);
    imgPath = fullfile(parentDir, ['cropped-' newItemName]);
    maskPath = fullfile(parentDir, ['mask-' newItemName]);
    img = imread(imgPath);
    mask = imread(maskPath);
    
    % Convert image and mask to grayscale in case they're not
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    if ndims(mask) == 3
        mask = rgb2gray(mask);
    end

    % Convert the mask to binary (assuming it's grayscale)
    mask = mask > 0;

    % Get the indices of the ROI
    [row, col] = find(mask);

    % Initialize GLCM
    GLCMs = zeros(256,256,4);

    % Calculate the GLCM for each direction using the ROI only
    for j = 1:length(row)
        if row(j) > 1 && mask(row(j)-1, col(j))   % Up (0 degrees)
            GLCMs(img(row(j),col(j))+1,img(row(j)-1,col(j))+1,1) = GLCMs(img(row(j),col(j))+1,img(row(j)-1,col(j))+1,1) + 1;
        end
        if row(j) > 1 && col(j) < size(mask,2) && mask(row(j)-1, col(j)+1)   % Upper right (45 degrees)
            GLCMs(img(row(j),col(j))+1,img(row(j)-1,col(j)+1)+1,2) = GLCMs(img(row(j),col(j))+1,img(row(j)-1,col(j)+1)+1,2) + 1;
        end
        if col(j) < size(mask,2) && mask(row(j), col(j)+1)   % Right (90 degrees)
            GLCMs(img(row(j),col(j))+1,img(row(j),col(j)+1)+1,3) = GLCMs(img(row(j),col(j))+1,img(row(j),col(j)+1)+1,3) + 1;
        end
        if row(j) < size(mask,1) && col(j) < size(mask,2) && mask(row(j)+1, col(j)+1)   % Lower right (135 degrees)
            GLCMs(img(row(j),col(j))+1,img(row(j)+1,col(j)+1)+1,4) = GLCMs(img(row(j),col(j))+1,img(row(j)+1,col(j)+1)+1,4) + 1;
        end
    end

    % Normalize each GLCM
    for j = 1:4
        GLCMs(:,:,j) = GLCMs(:,:,j) / sum(GLCMs(:,:,j),'all');
    end

    % Sum the GLCMs of different directions to create a direction invariant GLCM
    GLCM = sum(GLCMs,3);

    % Calculate the invariant Haralick features
    features = GLCMFeaturesInvariant(GLCM);
        
    % Write the headers to the Excel file if this is the first iteration
    if writeHeaders
        headers = ['RecordName', fieldnames(features)'];
        writecell(headers, filename, 'Range', 'A1');
        writeHeaders = false;
    end

    % Convert features to cell
    featuresCell = struct2cell(features);
    featuresCell = featuresCell(:)';  % to have it as a row vector

    % Write the features to the Excel file
    recordName = newItemName;
    outputCell = [recordName, featuresCell];
    writecell(outputCell, filename, 'WriteMode', 'append');   

end
