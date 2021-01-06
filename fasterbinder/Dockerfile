FROM ghcr.io/pankgeorg/pluto-on-binder:latest

ARG REPO_DIR=${HOME}
ENV REPO_DIR ${REPO_DIR}
WORKDIR ${REPO_DIR}

COPY ./fasterbinder/warmer.sh warmer.sh
COPY ./notebook.jl notebook.jl

RUN /bin/bash warmer.sh

ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint"]

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

