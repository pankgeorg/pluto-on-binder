FROM ghcr.io/pankgeorg/pluto-on-binder-faster@sha256:5d1f731698d299e1a7f0a9c6fe3b107c11eaa3b93c7841beed4d499023d2d7e7

USER ${NB_USER}

ARG REPO_DIR=${HOME}
ENV REPO_DIR ${REPO_DIR}
WORKDIR ${REPO_DIR}
# Set up user
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint"]

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

