FROM ubuntu:18.10

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV NOTEBOOK_PASSWORD=sha1:b9238c3cd292:8ac1417c199ae4a9eaa33ad5f7b2678c937a3be6

# install required tools
RUN groupadd -g 1000 notebook && useradd -u 1000 -d /notebooks -m -g notebook notebook \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends  \
        # required python packages
        python3 \
        python3-setuptools \
        python3-pip \
        # other usefull tools
        git \
        ssh \
        curl \
    && rm -rf /var/lib/apt/lists/* \
    # install dependencies 
    && python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir -U \
        pipenv \
        jupyter \
        jupyterlab \
        ipyparallel \
        requests \
        pandas \
        numpy \
        scipy \
        statsmodels \
        scikit-learn \
        tensorflow \
        matplotlib \
        seaborn \
        networkx \
        google-cloud-bigquery \
    # enable extentions
    && ipcluster nbextension enable

COPY docker-entrypoint.sh /usr/bin/

USER notebook
WORKDIR /notebooks
EXPOSE 8888
CMD ["docker-entrypoint.sh"]
