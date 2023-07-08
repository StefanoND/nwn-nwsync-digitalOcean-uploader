docker buildx build . -f nwsync.dockerfile -t nwnci/nwsync
docker run --rm -it --env-file %cd%/env.list nwnci/nwsync:latest
