FROM cm2network/steamcmd

LABEL maintainer="support@grumpyleopard.com"

WORKDIR /home/steam
USER steam

COPY --chown=steam:steam ./init-ark-server.sh ./init-ark-server.sh
RUN mkdir -p /home/steam/ark/ShooterGame/Saved/SavedArks \
    && chmod +x ./init-ark-server.sh

ENV CONFIGURL=""

VOLUME /home/steam/ark

CMD ["./init-ark-server.sh"]
