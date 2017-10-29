FROM ivotron/alpine-build-base:3.6

ADD . /root/stream/

RUN cd /root/stream && \
    mkdir out/ && \
    gcc -O2 stream.c              -o out/stream.100M.1NADDS && \
    gcc -O2 stream.c -DNADDS=2  -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.2NADDS && \
    gcc -O2 stream.c -DNADDS=4  -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.4NADDS && \
    gcc -O2 stream.c -DNADDS=6  -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.6NADDS && \
    gcc -O2 stream.c -DNADDS=8  -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.8NADDS && \
    gcc -O2 stream.c -DNADDS=10 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.10NADDS && \
    gcc -O2 stream.c -DNADDS=12 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.12NADDS && \
    gcc -O2 stream.c -DNADDS=14 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.14NADDS && \
    gcc -O2 stream.c -DNADDS=16 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.16NADDS && \
    gcc -O2 stream.c -DNADDS=18 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.18NADDS && \
    gcc -O2 stream.c -DNADDS=20 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.20NADDS && \
    gcc -O2 stream.c -DNADDS=30 -DSTREAM_ARRAY_SIZE=100000000 -o out/stream.100M.30NADDS

FROM alpine:3.6
COPY --from=0 /root/stream/out/* /usr/bin/
