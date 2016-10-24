FROM debian:latest

# no tty
ENV DEBIAN_FRONTEND noninteractive

# Update to latest state
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
  make \
  python-pip \
  python-dev \
  openjdk-7-jre \
  graphviz \
  python-pil \
  texlive texlive-latex-recommended \
  texlive-latex-extra \
  texlive-fonts-recommended

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  python-pil

RUN pip install Sphinx==1.4.6 \
    sphinx_rtd_theme \
    breathe \
    aafigure \
    sphinxcontrib-aafig \
    sphinxcontrib-plantuml

# Install plantuml
ADD files/plantuml.jar /opt/plantuml/plantuml.jar
ENV PLANTUML_JAR /opt/plantuml/plantuml.jar

CMD ["/bin/bash"]

WORKDIR /build-dir

# Use this command by default when running the machine
ENTRYPOINT ["/usr/bin/make"]