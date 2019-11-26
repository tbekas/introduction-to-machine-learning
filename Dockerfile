FROM jupyter/datascience-notebook:ad3574d3c5c7

USER root

RUN apt-get update && \
	apt-get install libz-dev

USER $NB_UID

RUN julia -e 'using Pkg; pkg"add WebIO"; using WebIO; WebIO.install_jupyter_nbextension();'

RUN julia -e 'using Pkg; pkg"add MLDatasets"; using MLDatasets; MNIST.download("/opt/julia/datadeps/MNIST", i_accept_the_terms_of_use=true)'

RUN julia -e 'using Pkg; pkg"add Interact"; \
                         pkg"add PyPlot";  \
                         pkg"add Optim"; \
                         pkg"precompile"'