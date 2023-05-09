
FROM docker.io/ibmcom/websphere-traditional

WORKDIR /

COPY config/ /work/config/

COPY  app/target/app.ear /work/config/user-app/
# COPY --from=compile /project/user-app/app.ear /work/config/user-app/

RUN /work/configure.sh
