FROM docker:18.06.1-ce-dind

RUN apk add --no-cache git \
                       python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python

RUN pip3 install -U awscli

RUN git clone https://github.com/mergermarket/cdflow /tmp/cdflow && \
    pip3 install -r /tmp/cdflow/requirements.txt && \
    cp /tmp/cdflow/cdflow.py /usr/local/bin/cdflow && \
    rm -rf /tmp/cdflow && \
    cdflow --validate-wrapper-installation

WORKDIR /workspace
