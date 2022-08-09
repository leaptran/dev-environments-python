FROM docker/dev-environments-default
FROM hdfgroup/hdf5lib:1.12.0
RUN sudo apt-get update && sudo apt-get install -y python3-venv python3-pip
RUN sudo ln -s /usr/bin/python3 /usr/bin/python
RUN sudo ln -s /usr/bin/pip3 /usr/bin/pip
