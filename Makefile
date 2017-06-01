all: compile

compile: clean
	erlc -o ebin/ src/bitmap.erl
	cp src/bitmap.app  ebin/

test: clean
	erlc -DTEST  -I test/ -o ebin/ src/bitmap.erl
	erl -pa ebin/ -noshell -s bitmap test -s init stop

clean:
	rm -rfv ebin/*.beam
	rm -rfv ebin/*.app
