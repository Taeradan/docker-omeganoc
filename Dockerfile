FROM ubuntu:14.04

RUN apt-get update && apt-get install -y python-pip python-pycurl sqlite3 graphviz graphviz-dev pkg-config python-dev libxml2-dev
RUN apt-get install -y git
RUN git clone --recursive https://github.com/Omega-Cube/omeganoc.git /omeganoc
WORKDIR /omeganoc
RUN useradd --user-group shinken
RUN make shinken-install
RUN shinken --init
RUN make install
RUN sed -i 's/modules\ *$/modules     graphite, livestatus, hokuto/' /etc/shinken/brokers/broker-master.cfg

ADD start.sh /
RUN chmod +x /start.sh

CMD /start.sh
