FROM httpd:2.4

WORKDIR /root/workspace

RUN apt-get update && apt-get install -y \
    apache2 \
    apache2-utils \
    libzip-dev \
    unzip \
    curl \
    git \
    lsb-release \
    ca-certificates \
    gnupg \
    wget \
    && apt-get clean

RUN curl -fsSL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs

RUN a2enmod rewrite

RUN chown -R www-data:www-data  /root/workspace

EXPOSE 5000