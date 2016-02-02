# Apache + PHP5.3 for legacy applications

PHP 5.4, despite being a minor update, introduced a series breaking changes in PHP language. There are
many legacy applications in the web that won't work with PHP older than 5.3. This docker image aims
to fix the problem, providing PHP 5.3 environment for legacy applications.

# Basic Usage

Image expects application's document root to be in `/web`.  

Create `Dockerfile` in root of webapplication, with:

```Dockerfile
FROM koder/apache-php-5.3
```

Build and run with:
```bash
docker build -t <project-name> .
docker run -it --rm -p 8080:80 <project-name>
```

