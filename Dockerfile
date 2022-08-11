# syntax=docker/dockerfile:1

FROM docker/dev-environments-default

# Add meta data to image (replaces MAINTAINER)
LABEL org.opencontainers.image.authors="anup@automationworks.io"

RUN cd /tmp																		; \
echo "Getting: Anaconda"														; \
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh		; \
bash ./Miniconda3-latest-Linux-aarch64.sh -b -p /conda

USER vscode:vscode
WORKDIR /home/vscode
COPY environment.yaml .
RUN /bin/bash -c 'source /conda/bin/activate; \
	conda env create -f environment.yaml; \
	conda init bash'
