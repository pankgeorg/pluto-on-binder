FROM ghcr.io/pankgeorg/jupyter-pluto:latest

USER ${NB_USER}

COPY --chown=${NB_USER}:users ./Manifest.toml ./Manifest.toml
COPY --chown=${NB_USER}:users ./Project.toml ./Project.toml
COPY --chown=${NB_USER}:users ./notebook.jl ./notebook.jl

COPY --chown=${NB_USER}:users ./postBuild ./postBuild

RUN /bin/bash postBuild

COPY --chown=${NB_USER}:users ./runpluto.sh ./runpluto.sh