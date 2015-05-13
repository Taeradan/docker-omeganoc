FROM ubuntu:14.04

RUN apt-get update && apt-get install python-pip python-pycurl sqlite3 graphviz graphviz-dev pkg-config python-dev libxml2-dev
ADD https://github.com/Omega-Cube/omeganoc.git /omeganoc
WORKDIR /omeganoc
RUN useradd --user-group shinken
RUN make shinken-install
RUN shinken --init
RUN make install
