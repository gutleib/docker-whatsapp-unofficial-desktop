# Base docker image
FROM debian:jessie
LABEL maintainer "Gutleib <gutleib@gmail.com>"

# WhatsApp Desktop version

RUN apt-get update && apt-get install -y \
    libx11-xcb1 \
    gconf2 \
    wget \
    curl \
    libgtk2.0-0 \
    libx11-xcb1 \
    libxtst6 \
    libxss1 \
    libnss3 \
    libasound2 \
    ca-certificates \
    libnotify4 \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN wget https://github.com$(curl https://github.com/Enrico204/Whatsapp-Desktop/releases|grep  whatsapp-desktop |grep deb|grep amd64|sed -n 1p|cut -d '"' -f2) -O /tmp/whatsapp.deb && \
    cd /tmp/ && \
    dpkg -i /tmp/whatsapp.deb || true && \
    apt-get -f install -y --no-install-recommends && \
    rm /tmp/whatsapp.deb && \
    rm /etc/fonts/conf.d/10-scale-bitmap-fonts.conf && \
    fc-cache -fv

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb

# Autorun WhatsApp
CMD ["/usr/local/bin/WhatsApp"]
