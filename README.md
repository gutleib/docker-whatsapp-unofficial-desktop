# docker-whatsapp-unofficial-desktop
A Docker image that start a fresh WhatsApp desktop client (https://github.com/Enrico204/Whatsapp-Desktop), based on the official WhatsApp web app client.

To spawn a new instance of WhatsApp Desktop:

```
docker run --rm -it --name whatsapp \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=unix$DISPLAY \
       --device /dev/snd \
       -v /etc/localtime:/etc/localtime:ro \
       -v ~/.config/whatsapp-desktop/:/root/.config/whatsapp-desktop/ \
       gutleib/whatsapp
