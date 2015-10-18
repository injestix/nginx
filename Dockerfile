FROM nginx

RUN apt-get update && apt-get install -y \
  nano

RUN mkdir /etc/nginx/sites-available && \
    mkdir /etc/nginx/sites-enabled


COPY nginx.conf /etc/nginx/nginx.conf

COPY sites-available/swerve /etc/nginx/sites-available/api
COPY sites-available/vendor /etc/nginx/sites-available/site

RUN ln -s /etc/nginx/sites-available/swerve /etc/nginx/sites-enabled/api && \
    ln -s /etc/nginx/sites-available/vendor /etc/nginx/sites-enabled/site
