# gif-factory

Convert any `.mov` file in your current diretory into a gif.

# Usage

Mount your local dir to `/tmp` and any `.mov` will produce a converted gif file.

```
docker run --rm -v $(pwd):/tmp gif-factory
```

### TODO

* Support more file types
* Configurable options
