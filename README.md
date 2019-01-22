# kong-sample-service

Sample Sinatra app used as a demo service for Kong

## Usage

* Build

```
make build
```

* Run

Serves by default on port `6666`.

Attaches itself to the `kong-net` Docker network.

```
make run
```

---

See `Makefile` for configuration options that can be set using ENV variables.
