FROM ghcr.io/pankgeorg/pluto-on-binder-faster@sha256:65793089bf0670b3a8b7abc0a3dd335e17f959e1ad5bf6d4a4dd8ccdb45260e1

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

