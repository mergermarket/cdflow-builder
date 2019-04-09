FROM docker:18.06.3-ce-dind

RUN apk add --no-cache git curl bash build-base \
                       openssl-dev libffi-dev \
                       python3-dev python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python

RUN pip3 install -U pip awscli docker-compose pipenv

RUN git clone https://github.com/mergermarket/cdflow /tmp/cdflow && \
    cd /tmp/cdflow && \
    pipenv install --system --deploy && \
    cp /tmp/cdflow/cdflow.py /usr/local/bin/cdflow && \
    rm -rf /tmp/cdflow && \
    python -c 'from importlib.util import spec_from_loader, module_from_spec; \
from importlib.machinery import SourceFileLoader; \
spec = spec_from_loader("cdflow", SourceFileLoader("cdflow", "/usr/local/bin/cdflow")); \
spec.loader.exec_module(module_from_spec(spec))'

COPY ./files/postStart /usr/local/bin/postStart

WORKDIR /workspace
