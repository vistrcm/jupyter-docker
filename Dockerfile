FROM ubuntu:18.10

ENV NOTEBOOK_PASSWORD=sha1:b9238c3cd292:8ac1417c199ae4a9eaa33ad5f7b2678c937a3be6

# install required tools
RUN groupadd notebook && useradd -d /notebooks -m -g notebook notebook \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends  \
        python3 \
        python3-setuptools \
        python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    # install dependencies 
    && pip3 install --no-cache-dir -U \
        jupyter

COPY docker-entrypoint.sh /usr/bin/

USER notebook
WORKDIR /notebooks
EXPOSE 8888
CMD ["docker-entrypoint.sh"]
