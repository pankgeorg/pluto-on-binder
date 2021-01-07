FROM ghcr.io/pankgeorg/pluto-on-binder-faster:sha256:702b399bd7c8af5335f3feacf2d5fb0f5b753b4d1e0477309b06f39ddf8d2521

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

