FROM docker.io/zmkfirmware/zmk-build-arm:stable

WORKDIR /app

COPY config/west.yml config/west.yml
COPY config/extra_morphs.dtsi config/extra_morphs.dtsi

RUN cat config/extra_morphs.dtsi | tee -a config/macros.dtsi

# West Init
RUN west init -l config
# West Update
RUN west update
# West Zephyr export
RUN west zephyr-export

COPY bin/build.sh ./

CMD ["./build.sh"]
