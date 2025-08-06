FROM nvcr.io/nvidia/pytorch:24.10-py3

WORKDIR /usr/src

RUN apt-get update && apt-get install -y \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    open-clip-torch \
    pillow \
    transformers \
    timm

COPY . /usr/src/

CMD ["python"]