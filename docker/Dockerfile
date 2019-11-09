FROM ruby:2.6.5

WORKDIR /root
ENV LANG C.UTF-8
ENV TZ="Asia/Tokyo"

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        nodejs \
        wget \
        git \
        less \
        man-db \
        rlwrap \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Gems
COPY ./.gemrc /root/
RUN gem install rails -v 5.1.6
RUN find /usr/local/bundle -type d -print0 |xargs -0 chmod 777

# port for web
EXPOSE 3000

# for convenience
COPY ./.bashrc /root/

# startup script
COPY ./dev.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/dev.sh
