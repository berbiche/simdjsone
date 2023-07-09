all: compile

deps:
	make -C c_src deps
	@[ -n "$(MIX_ENV)" ] && mix deps.get    || true
	@[ -z "$(MIX_ENV)" ] && rebar3 get-deps || true

compile:
	@[ -n "$(MIX_ENV)" ] && mix compile     || true
	@[ -z "$(MIX_ENV)" ] && rebar3 compile  || true

clean:
	rebar3 clean

test:
	rebar3 eunit

nif:
	make -C c_src

benchmark:
	@[ -n "$(MIX_ENV)" ] && mix benchmark           || true
	@[ -z "$(MIX_ENV)" ] && rebar3 as test do eunit || true

.PHONY: test
