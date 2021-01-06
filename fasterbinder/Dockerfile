FROM ghcr.io/pankgeorg/pluto-on-binder:latest

COPY ./fasterbinder/warmer.jl warmer.jl
COPY ./notebook.jl notebook.jl 

RUN /bin/bash warmer.jl

ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint"]

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

