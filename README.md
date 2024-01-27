# Dockerfile for lung nodule detection code

![Alt text](./dockerfile-lung-nodule-detection.svg)

[![forthebadge](https://forthebadge.com/images/badges/made-with-python.svg)](https://www.python.org/)
[![forthebadge](https://forthebadge.com/images/badges/uses-badges.svg)](https://forthebadge.com)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-no-red.svg)]( https://github.com/nsourlos/lung_nodule_detection_dockerfile)


> This tool can be used to create a docker image to run code related to lung nodule detection in CT scans. This code was last updated some years ago, and therefore, will not run if the latest dependencies are installed. This file includes the required dependencies and allow us to run the lung nodule detection code by using the Docker image. That way, this image can be used as an input in a secure platform, when data access should be secure.

Original scripts not included due to copyright issues.

Code used in the following papers:

[S. Zheng, J. Guo, X. Cui, R. N. J. Veldhuis, M. Oudkerk and P. M. A. van Ooijen, "Automatic Pulmonary Nodule Detection in CT Scans Using Convolutional Neural Networks Based on Maximum Intensity Projection," in IEEE Transactions on Medical Imaging, vol. 39, no. 3, pp. 797-805, March 2020, doi:10.1109/TMI.2019.2935553.](https://ieeexplore.ieee.org/document/8801875)

[Zheng S, Cornelissen LJ, Cui X, Jing X, Veldhuis RNJ, Oudkerk M, van Ooijen PMA. Deep convolutional neural networks for multiplanar lung nodule detection: Improvement in small nodule identification. Med Phys. 2021 Feb;48(2):733-744. doi:10.1002/mp.14648. Epub 2020 Dec 30. PMID: 33300162; PMCID: PMC7986069.](https://aapm.onlinelibrary.wiley.com/doi/10.1002/mp.14648)

An alternative to using Docker is Singularity. More information on how to use this can be found [here](https://medium.com/p/40121d0b843b)

## Documentation (by *Chat GPT*)

The documentation below was created by using the prompt 
> Write documentation for the following code

This is a Dockerfile used to create a Docker image. The Docker image is based on the `nvidia/cuda:11.2.2-base-ubuntu18.04` image, with the maintainer labeled as "nsourlos". The `WORKdir` is set to `/home/files/`.

The file [`requirements.txt`](/requirements.txt)) is copied into the current directory with the `COPY` command. The Dockerfile then runs a series of commands to install necessary packages and libraries for the image.

The first two `RUN` commands install `python3-pip` and upgrade the pip3 package. The following `RUN` commands then install necessary dependencies and libraries, such as `libsm6, libxext6, ffmpeg`, and `libxrender-dev`.

The pip3 command is used to install the efficientnet library, with version 0.0.4, and to install the dependencies listed in the `requirements.txt` file. The `h5py` package is then uninstalled and reinstalled with a specific version to avoid errors related to tensorflow.

The rest of the files are copied into the image with the `COPY` command, and the efficientnet folder is replaced with a modified version. The Docker image can then be built and run with the modified packages and libraries installed.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.