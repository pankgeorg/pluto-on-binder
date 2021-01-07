FROM ghcr.io/pankgeorg/pluto-on-binder:latest

ARG REPO_DIR=${HOME}
ENV REPO_DIR ${REPO_DIR}
WORKDIR ${REPO_DIR}
# Set up user
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN pip install pandas matplotlib

# These should live somewhere else
COPY ./plutoserver.py plutoserver.py
COPY ./requirements.txt requirements.txt

COPY ./notebook.jl notebook.jl
COPY ./Manifest.toml Manifest.toml
COPY ./Project.toml Project.toml

RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

COPY ./fasterbinder/warmer.sh warmer.sh

RUN /bin/bash warmer.sh

ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint"]

RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

