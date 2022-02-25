FROM rust:1

ARG DOCKER_ARG_VERSION
ARG DOCKER_ARG_REV
ARG DOCKER_ARG_BRANCH
ARG DOCKER_ARG_BUILD_USER

COPY . /opt/data
WORKDIR /opt/data

RUN cargo build --release

#########################################################################################

FROM gcr.io/distroless/base
COPY --from=0 /opt/data/target/release/i0nio /usr/bin/public 

WORKDIR /usr/bin

EXPOSE 8000

CMD ["i0nio"]
