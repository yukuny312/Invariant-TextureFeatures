# Gray Level Invariant Texture Features
[Paper PlaceHolder]

## Overview
The key contributions of this work: 

(1) Extend the normalization method to texture features in GLCM, GLSZM, GLRLM, GLDM and NGTDM.

(2) Compare the invariant texture feature properties derived from the normalization factor method with the well-defined Haralick method.

(3) Analyze the invariance of texture features using statistical measurement and visualized characterized map.

(4) Investigate the application of invariant texture features for image classification.

## Dataset
1. Brain Tumor Segmentation 2020 Dataset [BraTS 2020](https://www.kaggle.com/datasets/awsaf49/brats20-dataset-training-validation)


2. Fresh and Rotten Fruits Dataset [FRFD](https://data.mendeley.com/datasets/bdd69gyhv8/1)

## Usage
There are three subfolders under main branch.
* BraTS2020
  - Originial_Radiomics_Feature.ipynb: calculate original radiomic features.
  - InvariantFeatures.ipynb: calculate invariant radiomic features.
  - VisualizationMap.ipynb: generate visualization map.
  - Classification_GLCM_Features.ipynb & Classification_ALL_Features.ipynb: classificaition based on GLCM/all features.
  
* FRFD
  - Same calculation process as BraTS2020 but using FRFD dataset.
    
* Haralick
  - Calculate Haracick GLCM features.
   
## Citations
If you find this repository useful, please consider giving a star ⭐ and citation!

## References
https://github.com/patrik-brynolfsson/invariant-haralick-features?tab=readme-ov-file
