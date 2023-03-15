# temp stage
FROM python:3.10-slim as builder

#hide debconf warnings (not recommended)
#ENV DEBIAN_FRONTEND noninteractive
#ENV DEBCONF_NOWARNINGS="yes"

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install --upgrade pip

COPY requirements.txt .
#The recommended way to silence warning is to enable the --use-pep517 flag
RUN pip install -r requirements.txt --use-pep517


# final stage
FROM python:3.10-slim

COPY --from=builder /opt/venv /opt/venv

WORKDIR /app


# Enable venv and start app
ENV PATH="/opt/venv/bin:$PATH"

COPY . /app/

CMD ["python", "app.py"]