FROM docker:18.06.1-ce-dind

RUN apk add --no-cache git curl bash \
                       python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python

RUN pip3 install -U awscli docker-compose

RUN git clone https://github.com/mergermarket/cdflow /tmp/cdflow && \
    pip3 install -r /tmp/cdflow/requirements.txt && \
    cp /tmp/cdflow/cdflow.py /usr/local/bin/cdflow && \
    rm -rf /tmp/cdflow && \
    python -c 'from importlib.util import spec_from_loader, module_from_spec; \
from importlib.machinery import SourceFileLoader; \
spec = spec_from_loader("cdflow", SourceFileLoader("cdflow", "/usr/local/bin/cdflow")); \
spec.loader.exec_module(module_from_spec(spec))'

WORKDIR /workspace
