FROM ubuntu:14.04
MAINTAINER Leonid Gorshkov <dzhangr.lv@gmail.com>

ENV TEST_DIR /tmp/TEST_DIR/
ENV WEBAPP /opt/webapp/
RUN mkdir -p "$TEST_DIR"
RUN mkdir -p "$WEBAPP"
WORKDIR $TEST_DIR

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q git python-all python-pip

ADD .app/requirements.txt /tmp/requirements.txt

RUN pip install -qr /tmp/requirements.txt

WORKDIR $WEBAPP
ADD .app/* /opt/webapp/

EXPOSE 5000
CMD ["python", "app.py"]

