FROM continuumio/miniconda3

# update conda to the newest version
RUN conda update -n base -c defaults conda

RUN useradd --create-home appuser

WORKDIR /home/appuser
USER appuser

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# The code to run when container is started:
COPY run.py .