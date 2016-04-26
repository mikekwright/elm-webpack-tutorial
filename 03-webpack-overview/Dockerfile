FROM mikewright/elm-webpack:STEP-2

RUN npm install -g webpack webpack-dev-server

EXPOSE 8080

ADD startup /tmp/startup
CMD ["/tmp/startup"]

