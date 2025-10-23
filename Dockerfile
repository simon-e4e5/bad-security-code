# Old base + floating tags + root user + curl|sh
FROM ubuntu:18.04

# No USER specified -> runs as root
WORKDIR /app
COPY . /app

# Bad: no pinning, curl|sh pattern
RUN apt-get update && apt-get install -y curl \
 && curl -sL https://example.com/install.sh | sh \
 && rm -rf /var/lib/apt/lists/*

# No HEALTHCHECK, exposes root FS RW, using latest (implicit) tags elsewhere
CMD ["bash", "-c", "sleep infinity"]
