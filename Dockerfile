###########################################################
# Dockerfile that builds a Valheim server
###########################################################
FROM kaekh/steamcmd

ARG UID=1000
ARG GID=1000

ENV USER steam
ENV GROUP steam
ENV HOME /opt/valheim
ENV SERVERNAME ValheimServer
ENV PORT 2456
ENV WORLDNAME worldname
ENV PASSWORD password

#Install and update packages
RUN apt-get update \
        && apt-get install -y --no-install-recommends --no-install-suggests \
                lib32gcc1 \
                vim

#download start script and init folders
RUN mkdir -p "${HOME}" \
        && groupadd -g ${GID} ${GROUP} \
        && useradd --no-log-init -d ${HOME} -u ${UID} -g ${GROUP} ${USER}

COPY ./start_valheim.sh ${HOME}/start_valheim.sh

RUN chown -R ${USER}:${USER} ${HOME} \
        && chmod +x ${HOME}/start_valheim.sh

USER ${USER}

WORKDIR ${HOME}

CMD ["bash", "start_valheim.sh"]
