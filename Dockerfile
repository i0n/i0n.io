FROM rust as builder

ARG DOCKER_ARG_VERSION
ARG DOCKER_ARG_REV
ARG DOCKER_ARG_BRANCH
ARG DOCKER_ARG_BUILD_USER

WORKDIR /app
COPY . /app
RUN cargo build --release

FROM gcr.io/distroless/cc as runtime
COPY --from=builder /app/target/release/i0nio /
EXPOSE 8000
#CMD ["/bin/bash"]
#CMD ["/app/target/release/i0nio"]
CMD ["/i0nio"]
