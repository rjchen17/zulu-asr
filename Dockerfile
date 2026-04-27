FROM continuumio/miniconda3

WORKDIR /workspace

COPY environment.yml ./
RUN conda env create -f environment.yml

RUN git clone --depth 1 https://github.com/facebookresearch/fairseq && \
    cd fairseq && \
    conda run -n fairseq pip install --editable ./

# Set environment variable for GPU-enabled inference
ENV USE_CUDA=1
RUN git clone ...flashlightsequnece && \
    cd sequence && \
    conda run -n fairseq pip install --editable ./