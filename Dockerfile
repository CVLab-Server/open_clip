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

# Download and cache the model during build
RUN python3 -c "import open_clip; print('Downloading and caching ViT-B-32 model...'); model, _, _ = open_clip.create_model_and_transforms('ViT-B-32', pretrained='laion2b_s34b_b79k'); print('Model cached successfully!')"

CMD ["python"]