FROM php:7.4-fpm
COPY php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get install -y \
                git \
                zip \
                unzip \
                vim \
                libonig-dev \
                libfreetype6-dev \ 
                libjpeg62-turbo-dev \
                libpng-dev \
                libjpeg-dev \
                libpq-dev \
    && docker-php-ext-install \ 
                pdo_mysql \ 
                pdo_pgsql \
                bcmath \
                gd \
    && docker-php-ext-configure gd \
                --with-freetype=/usr/include/ \
                --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# デバッグ環境を追加
RUN pecl install xdebug \
  && docker-php-ext-enable xdebug

#Composer install
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# rootでのcomposerコマンド実行を許可
ENV COMPOSER_ALLOW_SUPERUSER 1
# composerのグローバルパッケージがインストールされるディレクトリの指定
ENV COMPOSER_HOME /composer
# composerのパスを通す
ENV PATH $PATH:/composer/vendor/bin
# laravelインストール
RUN composer global require "laravel/installer"

RUN curl -SL https://deb.nodesource.com/setup_14.x | bash
RUN apt-get install -y nodejs && \
  npm install -g npm@latest && \
  npm install -g @vue/cli

WORKDIR /tmp/
# xdebugログの書き込み権限を追加
RUN chmod 777 -R ./xdebug.log

WORKDIR /var/www/html/acrovision_e_learning