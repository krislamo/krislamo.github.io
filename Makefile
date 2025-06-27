.PHONY: install clean

install:
	bundle config set --local path 'vendor/bundle'
	bundle install
	bundle exec jekyll serve

clean:
	rm -rf _site vendor .bundle .jekyll-cache

