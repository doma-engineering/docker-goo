FROM erlang:24

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.15.0-dev" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/doma-engineering/goo/archive/c998007b20c37db5bf59e8ba85dddc30804155bf.tar.gz" \
	&& ELIXIR_DOWNLOAD_SHA256="82e68497993e95efc38a126e8986b077fbfd65e1f29abb9ac36827836567519a" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean \
	&& find /usr/local/src/elixir/ -type f -not -regex "/usr/local/src/elixir/lib/[^\/]*/lib.*" -exec rm -rf {} + \
	&& find /usr/local/src/elixir/ -type d -depth -empty -delete

CMD ["iex"]
