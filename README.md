# Invariant Texture Features to Gray Level Discretization
[Paper PlaceHolder]

## Overview
The key contributions of this work: 

(1)	A normalization-based invariant texture feature extraction method is proposed.

(2) Classification performance is systematically compared between original and invariant texture features.

(3) Invariant features exhibit superior stability across medical and non-medical datasets.

(4) •	The proposed method consistently outperforms the original features under diverse data conditions.

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
