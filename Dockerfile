FROM ghcr.io/astral-sh/uv:debian-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV LANG=en_US.UTF-8
ENV PATH="/app/.venv/bin:$PATH"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
	bash \
        git \
        curl \
        ca-certificates \
        locales && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
# Copy the requirements file
COPY requirements.txt .

# Install dependencies using the standard Python tool
RUN python3 -m pip install --no-cache-dir -r requirements.txt
RUN chmod +x start.sh
CMD ["bash", "start.sh"]
