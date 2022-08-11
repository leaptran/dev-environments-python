# dev-environments-python
Reference image to support development of Leaptran open source projects

Starting with docker/dev-environments-default
Adds Miniconda (python 3.9) and our various commonly used python libraries
*CAUTION* Miniconda was installed using the Linux-aarch64 architecture for use on Apple M1 and M2 platforms
	Use on other platforms at your own risk.

Once container is running, execute `conda activate cvenv` (leaptran open source projects)
or `conda activate base` for a minimal/clean python3.9 environment
