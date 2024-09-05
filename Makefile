.PHONY: build clean serve publish

build:
	rm -rf build && mkdir build
	ruby wruby.rb 

serve: build
	python3 -m http.server --directory build

clean:
	rm -rf build/*

publish: build
	git checkout gh-pages
	find . -mindepth 1 -maxdepth 1 ! -name ".git" -exec rm -rf {} +
	mv build/* .
	git add .
	git commit -m "Automated deployment"
	git push origin gh-pages
	git switch main



