FROM ubuntu:14.04
MAINTAINER Leonid Gorshkov <dzhangr.lv@gmail.com>

ENV TEST_DIR /tmp/TEST_DIR/
ENV WEBAPP /opt/webapp/
RUN mkdir -p "$TEST_DIR"
RUN mkdir -p "$WEBAPP"
WORKDIR $TEST_DIR

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q git python-all python-pip

RUN set -e; \
    \
    git clone "https://github.com/dzhangrLV/test27042019.git"; \
    cd "$TEST_DIR/test27042019/"; \
    cp requirements.txt /tmp/requirements.txt

#RUN git clone "https://github.com/dzhangrLV/test27042019.git"
#COPY /tmp/test27042019/requirements.txt /tmp/requirements.txt
RUN pip install -qr /tmp/requirements.txt

WORKDIR $WEBAPP
COPY /tmp/TEST_DIR/test27042019/* /opt/webapp/

EXPOSE 5000
CMD ["python", "app.py"]

