FROM tarampampam/node:current-alpine

RUN apk add wget unzip
RUN mkdir /assistant-relay
RUN wget "https://github.com/greghesp/assistant-relay/releases/latest/download/release.zip" -O /assistant-relay/release.zip
RUN unzip /assistant-relay/release.zip -d /assistant-relay && rm /assistant-relay/release.zip

RUN npm i --prefix /assistant-relay

VOLUME /assistant-relay/server/configurations/secrets
VOLUME /assistant-relay/server/configurations/tokens

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

RUN if [ "$(ls -A /assistant-relay/bin)" ]; then mkdir /config &&  cp -R /assistant-relay/bin/* /config/; else "directory empty"; fi

EXPOSE 3000

ENTRYPOINT "/startup.sh"

