FROM nginx
MAINTAINER Eric Fehr Eric.fehr@publicis-modem.fr
LABEL description="Host only a dissalow robots.txt"

RUN echo 'User-agent: *' >/usr/share/nginx/html/robots.txt 
RUN echo 'Disallow: /' >>/usr/share/nginx/html/robots.txt
