.PHONY: install clean

install:
	bundle config set --local path 'vendor/bundle'
	bundle install
	bundle exec jekyll serve --future

clean:
	rm -rf _site vendor .bundle .jekyll-cache
