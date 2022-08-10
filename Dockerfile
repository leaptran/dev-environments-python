FROM docker/dev-environments-default

# hdf5lib build commands (snapshotted from version indicated below)
ENV HDF5_MAJOR_REL       hdf5-1.12
ENV HDF5_MINOR_REL       hdf5-1.12.0
ENV HDF5_SRC_URL   http://support.hdfgroup.org/ftp/HDF5/releases
RUN cd /tmp                                                                        ; \
	echo "Getting: ${HDF5_SRC_URL}/${HDF5_MAJOR_REL}/${HDF5_MINOR_REL}/src/${HDF5_MINOR_REL}.tar"                ; \
	wget ${HDF5_SRC_URL}/${HDF5_MAJOR_REL}/${HDF5_MINOR_REL}/src/${HDF5_MINOR_REL}.tar                           ; \
	tar -xvf ${HDF5_MINOR_REL}.tar --directory /usr/local/src                      ; \
	rm ${HDF5_MINOR_REL}.tar                                                       ; \
	cd /usr/local/src/${HDF5_MINOR_REL}                                            ; \
	./configure --prefix=/usr/local/hdf5                                           ; \
	make                                                                           ; \
	make check                                                                     ; \
	make install                                                                   ; \
	make check-install                                                             ; \
	for f in /usr/local/hdf5/bin/* ; do ln -s $f /usr/local/bin ; done             ; \
	pip install numpy                                                              ; \
	pip install s3fs                                                               ; \
	cd /usr/local/src                                                              ; \
	git clone https://github.com/h5py/h5py.git                                     ; \
	cd h5py                                                                        ; \
	export HDF5_DIR=/usr/local/hdf5                                                ; \
	python setup.py build                                                          ; \
	python setup.py install                                                        ; \
	cd -                                                                           ; \
	git clone https://github.com/HDFGroup/h5pyd.git                                ; \
	cd h5pyd                                                                       ; \
	python setup.py install                                                        ; \
	cd -     

 RUN sudo apt-get update && sudo apt-get install -y python3-venv python3-pip
 RUN sudo ln -s /usr/bin/python3 /usr/bin/python
 RUN sudo ln -s /usr/bin/pip3 /usr/bin/pip
