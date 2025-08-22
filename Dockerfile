FROM debian AS source
RUN apt-get update && apt-get install --yes wget
RUN mkdir -p /sources
RUN wget https://vtk.org/files/release/9.5/VTK-9.5.0.tar.gz -O /sources/VTK_SRC_9_5_0.tgz
RUN wget https://github.com/simbody/simbody/archive/refs/tags/Simbody-3.8.tar.gz -O /sources/Simbody_SRC_3_8_0.tgz

FROM scratch
COPY --from=source /sources/VTK_SRC_9_5_0.tgz /
COPY --from=source /sources/Simbody_SRC_3_8_0.tgz /
