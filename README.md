# Apache + PHP5.3 for legacy applications

[![Build Status](https://travis-ci.org/lekoder/docker-apache-php-5.3.svg?branch=master)](https://travis-ci.org/lekoder/docker-apache-php-5.3)

PHP 5.4, despite being a minor update, introduced a series breaking changes in PHP language. There are
many legacy applications in the web that won't work with PHP older than 5.3. This docker image aims
to fix the problem, providing PHP 5.3 environment for legacy applications.

# Basic Usage

Image expects application's document root to be in `/web`.  

Create `Dockerfile` in root of webapplication, with one line:

```Dockerfile
FROM koder/apache-php-5.3
```

Build and run with:
```bash
docker build -t <project-name> .
docker run -it --rm -p 8080:80 <project-name>
```

## Dependencies

This image installs dependencies automaticly, just place relevant file in root of your legacy application.

* `bower.json` will run `bower install`
* `package.json` will run `npm install`
* `composer.json` will install composer and run `composer.phar install`

## Using custom php.ini

If you place `php.ini` file in root of your application, it will be used as `conf.d`.


## Email

If possible, you should use `smtp` to send e-mails from your application. If your legacy app
relies on PHP `mail()` function and is impractical to rewrite, this image comes pre-installed
with [ssmtp](https://wiki.debian.org/sSMTP) to push your emails to specified external `smtp`
service. To use `ssmtp` simply place `ssmtp.conf` file in root of your application. Minimal
example:

```
root=yourmail@mail.com
mailhub=smtp.yourmail.com
hostname=yourserver.example.com
FromLineOverride=YES
AuthUser=username@gmail.com
AuthPass=password
```  
