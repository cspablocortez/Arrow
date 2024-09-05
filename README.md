# Arrow

## Introduction

Arrow is a terminal-based content management system 
built on [wruby](https://git.sr.ht/~bt/wruby).

### Features

All the features of **wruby**:

* Fast, OS-agnostic site generator
* Markdown support
* Auto-generated, valid [RSS feed](/index.rss)
* Custom `header.html` and `footer.html` templates

Plus:

* An easy-to-use CMS for writer happiness.


## Dependencies

- Ruby

## Getting Started

Make your changes in the main configuration file `_config.yml` file 
(site URL, your name, description). 

* Blog posts go under the `posts` directory as markdown files
  - Posts need to be structured with an `h1` on the first line, a space on the
    second, and the date on the third line (e.g., 2024-09-04).

* Pages go under the `pages` directory as markdown files
* Media (images, videos etc) go in the root `public` directory

## Defaults

* The homepage only displays the first `5` posts. You can configure this in `_config.yml` under `post_count`.
* The full blog post index will be generated at `yoursite.com/posts`
  * This means you need to have a `posts.md` file in your `pages` directory (or change `posts_index` the core `_config.yml`)

## Running

1. Run `make build` in the root directory (this will automatically install required `gems`)
2. Upload `build` folder to your server
3. Share your blog or site!
