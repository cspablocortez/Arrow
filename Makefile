build:
	rm -rf build && mkdir build
	ruby wruby.rb 

serve: build
	python3 -m http.server --directory build

clean:
	rm -rf build/*

.PHONY: build clean
