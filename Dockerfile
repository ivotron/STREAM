FROM ivotron/alpine-build-base:3.6

ADD . /root/stream/

RUN cd /root/stream && \
    mkdir out/ && \
    gcc -O2 stream.c              -o out/stream.100M.1C && \
    gcc -O2 stream.c -DNCYCLES=2  -o out/stream.100M.2C && \
    gcc -O2 stream.c -DNCYCLES=4  -o out/stream.100M.4C && \
    gcc -O2 stream.c -DNCYCLES=8  -o out/stream.100M.8C && \
    gcc -O2 stream.c -DNCYCLES=10 -o out/stream.100M.10C && \
    gcc -O2 stream.c -DNCYCLES=12 -o out/stream.100M.12C && \
    gcc -O2 stream.c -DNCYCLES=14 -o out/stream.100M.14C && \
    gcc -O2 stream.c -DNCYCLES=16 -o out/stream.100M.16C && \
    gcc -O2 stream.c -DNCYCLES=18 -o out/stream.100M.18C && \
    gcc -O2 stream.c -DNCYCLES=20 -o out/stream.100M.20C

FROM alpine:3.6
COPY --from=0 /root/stream/out/* /usr/bin/
