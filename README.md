# Rumbl

Try the OTP counter

```bash
$ dc run app \
    iex -S mix
iex> alias Rumbl.Counter
iex> {:ok, c} = Counter.start_link(0)
iex> Counter.inc(c)
iex> Counter.inc(c)
iex> Counter.val(c)
iex> Counter.dec(c)
iex> Counter.val(c)
```
