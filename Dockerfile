FROM docker:18.06.1-ce-dind

RUN apk add --no-cache git curl bash \
                       python3 && \
    ln -s /usr/bin/python3 /usr/local/bin/python

RUN pip3 install -U awscli docker-compose

RUN curl -L "https://github.com/mergermarket/cdflow/releases/download/$(python -c "from urllib.request import urlopen; import json; print(json.loads(urlopen('https://api.github.com/repos/mergermarket/cdflow/releases/latest').read())['tag_name'])")/cdflow-Linux-x86_64" -o /usr/local/bin/cdflow && \
    chmod +x /usr/local/bin/cdflow

WORKDIR /workspace
