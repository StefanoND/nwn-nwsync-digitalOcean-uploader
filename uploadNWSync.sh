docker buildx build . -f nwsync.dockerfile -t nwnci/nwsync
docker run --rm -it --env-file ./env.list nwnci/nwsync:latest
if [[ -f nwsync/README.md ]]; then
    rm nwsync/README.md
fi
