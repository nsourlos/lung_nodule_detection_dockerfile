# This line specifies the base image to be used for the Docker container.
# It is using the CUDA 11.2.2 runtime environment from Nvidia on an Ubuntu 18.04 base image.
FROM nvidia/cuda:11.2.2-base-ubuntu18.04

# This line adds a label with the name of the maintainer to the Docker image.
LABEL maintainer="nsourlos"

# This line sets the working directory inside the Docker container to "/home/files/".
WORKDIR /home/files/

# This line copies the "requirements.txt" file from the host system to the working directory inside the Docker container.
COPY ./requirements.txt .

# This line runs two commands to update the apt package index and install Python3 and pip.
RUN apt-get update && apt-get install -y \
    python3-pip

# This line upgrades pip to the latest version.
RUN pip3 install --upgrade pip

#Some fixes for the opencv errors
RUN apt update && apt install -y libsm6 libxext6 ffmpeg \
    && apt-get install -y libxrender-dev \
    && apt-get clean

#Install efficientnet used during training
RUN pip3 install --no-cache -U efficientnet==0.0.4

#Delete installation folder - replace it with a modified one
RUN rm -r /usr/local/lib/python3.6/dist-packages/efficientnet

#Install Dependencies
RUN pip3 install --no-cache -r requirements.txt

#To avoid errors related to tensorflow: AttributeError: 'str' object has no attribute 'decode'
#Installs specific version of h5py
RUN pip3 uninstall -y h5py
RUN pip3 install --no-cache h5py==2.10.0

#Now we can copy everything - Used down here to save time in each compile step
# This line copies all files from the host system to the working directory inside the Docker container.
COPY . .

#Replace efficientnet with a few modifications - Same if ADD is used
COPY ./efficientnet/ /usr/local/lib/python3.6/dist-packages/efficientnet/
