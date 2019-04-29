FROM ubuntu:14.04
MAINTAINER Leonid Gorshkov <dzhangr.lv@gmail.com>

ENV TEST_DIR /tmp/TEST_DIR/
ENV WEBAPP /opt/webapp/
RUN mkdir -p "$TEST_DIR"
RUN mkdir -p "$WEBAPP"
WORKDIR $TEST_DIR

RUN apt-get update
RUN git clone "https://github.com/dzhangrLV/test27042019.git"
COPY $TEST_DIR/test27042019/requirements.txt /tmp/requirements.txt
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q git python-all python-pip && pip install -qr /tmp/requirements.txt && rm -rf /var/lib/apt/lists/*


WORKDIR $WEBAPP
COPY $TEST_DIR/test27042019/* $WEBAPP

EXPOSE 5000
CMD ["python", "app.py"]

