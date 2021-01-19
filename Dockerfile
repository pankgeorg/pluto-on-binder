FROM julia:latest

ENV USER pluto
ENV USER_HOME_DIR /home/${USER}
ENV JULIA_DEPOT_PATH ${USER_HOME_DIR}/.julia
ENV NOTEBOOK_DIR ${USER_HOME_DIR}/notebooks
ENV JULIA_NUM_THREADS 100

RUN useradd -m -d ${USER_HOME_DIR} ${USER} \
    && mkdir ${NOTEBOOK_DIR}

COPY jupyter ${USER_HOME_DIR}/

USER ${USER}

EXPOSE 8888
VOLUME ${NOTEBOOK_DIR}
WORKDIR ${NOTEBOOK_DIR}

USER root
RUN mv ./jupyter /opt/jupyter && \
    ls -s /opt/jupyter /usr/local/bin/jupyter && \
    chmod +x /opt/jupyter
# CMD [ "julia", "/home/pluto/startup.jl" ]

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
