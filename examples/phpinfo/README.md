Minimal example.

# Build and test

```bash
docker build -t example-phpinfo .
docker run -it --rm -p 8080:80 example-phpinfo
```

Point your browser to [localhost:8080](http://localhost:8080/) to see effects.
