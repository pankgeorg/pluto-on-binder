FROM ghcr.io/pankgeorg/pluto-on-binder:latest

USER ${NB_USER}

ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint"]

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

