FROM haskell:8.8.4
WORKDIR /opt/meatbar

COPY ["stack.yaml", "package.yaml", "meatbar.cabal", "./"]
RUN ["stack", "install", "--dependencies-only"]

COPY ["app", "./app"]
COPY ["src", "./src"]
COPY ["webapp", "./webapp"]
RUN ["stack", "install"]
RUN ["stack", "build"]
COPY . .
EXPOSE 8080
ENTRYPOINT ["stack"]
CMD ["run"]
