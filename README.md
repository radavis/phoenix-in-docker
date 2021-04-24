# Rumbl

Run tests

```bash
$ dc exec app mix test
```

Run a single test

```bash
$ dc exec app \
    mix test test/controllers/page_controller_test.exs:4
```

Run a tagged test

```bash
$ dc exec app \
    mix test test/controllers --only login_as
```
