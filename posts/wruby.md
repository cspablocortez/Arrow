# The wruby static site generator

2024-09-05

I came across a static site generator called [wruby](https://wruby.btxx.org).

It's a single-file static site generator and blogging platform. All in one file!

It's a really cool idea for a project. 
As of September 2024, the site at this domain is built with 
[Jekyll](https://jekyllrb.com).

If using an external theme, Jekyll is easy to manage. But
developing a custom theme while writing new posts from within
the same project directory is overwhelming. There's a sudden
set of tools (bundler, gems, YAML) I'm expected to remember
along with several files, a large portion of them *partials*, 
reusable pieces of HTML that can be injected wherever in an
HTML file. 

But what if I want to create a new post and publish it on my
website?

On this site, the process is linked to Github Pages such that
`git push` is enough to publish after I have finished making
changes and tracking them appropriately with git. It takes a 
few seconds.

But starting the changes (i.e., creating a new post) is the 
process that takes the longest. First a new file with the
format `YYYY-MM-DD-post-title.md` must be created in `posts/`.
Next I have to add [Front Matter](https://jekyllrb.com/docs/front-matter/),
a special code block that lets me select an HTML template
for my markdown code and set configuration values among other
things.


This is one of many conventions that Jekyll adopts to make working 
with its internal tooling easier. Jekyll's breadth of configuration is what 
makes it a safe choice for developers. It allows for complex modular web development and leaves the frontend architecture entirely up to 
the programmer. 

For example, this website runs on Jekyll. This post is currently a markdown
file in the `_posts` folder, a file I have open in Sublime Text. When I'm
ready to see a preview of my changes, I should run the command `bundle exec jekyll serve` 
to start a local server that shows a live version of the output created by the
Jekyll build process.

This command is of course far too long to type every time I want to restart my server,
so I aliased it in my shell to `pvw`, short for `preview`. Although changes 
in the source files cause Jekyll to rebuild and update the page 
automatically, I used the function throughout development enough times to warrant
a shortcut, since configuration file changes do require a restart.

The command itself is long because the program needs to ensure 
gem dependencies are met. Jekyll provides a large number of features
through gems, such as search engine optimization, pagination, support
for a template language, and even complete themes. 

<div style="text-align: center; padding: 1rem;" >
&mdash;&mdash;&mdash;
</div>

I read Giles Turnbull's thoughts on [gilest.org](https://gilest.org/indie-easy.html) about what independent web publishing in the style of the [Indieweb](https://indieweb.org) needs:

> We need more self-hosted platforms for personal publishing that aren’t Wordpress. And don’t point me to Hugo or Netlify or Eleventy or all those things - all of them are great, but none of them are simple enough. We need web publishing tools that do not require users to open the Terminal at all. And we need lots of them.

And it's true. I remember spending a few days over a couple of months this past year
reading the Jekyll documentation and getting familiar with its suite of 
dependencies and conventions, from the syntax of the Liquid template language to
the configuration options and default variable values. And that was the first part. 
Next was understanding how Jekyll integrates with Github Pages 
using Github Actions, and while Github does provide Jekyll support by default,
there are conflicts between the github-pages gem and some Jekyll versions. 
One such example is Jekyll and its default template, which required me to
update a Gemfile, remove the Jekyll gem, then to include [github-pages](https://github.com/github/pages-gem) and 
[webrick](https://github.com/ruby/webrick).
Add Linux as a platform to the Gemfile.lock because we are configuring
for the Github server. Finally commit and push changes
to the repository. Now you're done!


At one point the project file structure starts looking something like this:

~~~sh
.
├── _config.yml
├── _data
│   └── members.yml
├── _drafts
│   ├── begin-with-the-crazy-ideas.md
│   └── on-simplicity-in-technology.md
├── _includes
│   ├── footer.html
│   └── header.html
├── _layouts
│   ├── default.html
│   └── post.html
├── _posts
│   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
│   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _sass
│   ├── _base.scss
│   └── _layout.scss
├── _site
├── .jekyll-cache
│   └── Jekyll
│       └── Cache
│           └── [...]
├── .jekyll-metadata
└── index.html # can also be an 'index.md' with valid front matter
~~~


As a programmer who has grown extremely fond of the Ruby programming language
and its community, learning all of this was fun. I learned so much about
the project and the Ruby software ecosystem. I watched tutorials on YouTube, talks at developer conferences. I read a bit on the history of each project. It was really cool to find out that Jekyll was built by 
[Tom Preston-Werner](https://tom.preston-werner.com), who also created GitHub. I learned Liquid was developed by Shopify and that the creator of 
[Rake](https://github.com/ruby/rake), Jim Weirich, tells the story of developing the project in 
the [initial keynote](https://www.youtube.com/watch?v=0D3KfnbTdWw) of RubyConf Uruguay 2011. 

While the developer part of me enjoys this rich
software ecosystem, the writer part of me feels an information
overload everytime I open the project on my text editor. 
It didn't take long before I had created scripts that
automated tasks like creating new posts. The default way
was to manually create markdown files that adhered to a 
specific filename format. While immensely helpful in processing
dates, it was also burdensome and a deterrent to writing
new posts. After automating this process, writing became
more enjoyable.

But the evidence is in the results. I didn't keep writing not
because I didn't know what to say, but because there was
no tool that made doing so easy. There was always something 
separating idea from draft and draft from deployment.

This gap in processes could be bridged through more
scripts, surely, but there's more fun to be had in
building a new thing from scratch. 

<div style="text-align: center; padding: 1rem;" >
&mdash;&mdash;&mdash;
</div>

In his article, Giles goes on to say:

> Let’s give people choices. Let’s give people options for tools they can set up and use, with no more knowledge than the knowledge they already have.



Bradley Taunt, the author of the single-file [wruby](https://wruby.btxx.org) static site generator, offers
an alternative to Jekyll's complexity by writing a program that synthesizes template language
and build system. The CSS of the site is reduced to few revisions upon default 
browser settings, packed into a minimized stylesheet, all within the same `header.html` file
that handles navigation.

This is the right idea. 

I initially tested Bradley's static site generator on Termux, a terminal emulator for 
Android running on a tablet. I knew I had to try it in unlikely
environments when his [sourcehut repository]((https://git.sr.ht/~bt/wruby)) 
proudly claimed Ruby as its only dependency.

![wruby README screenshot](https://cspablocortez.github.io/assets/images/wruby-readme.jpeg)

All I had to do was run `make build` and this installed any dependencies it needed 
([kramdown](https://kramdown.gettalong.org/index.html) for markdown 
to html conversion and [rss](https://rubygems.org/gems/rss) for producing 
the rss feed). 

Ironically, there was an issue with the build, as the specified version
on the [inline Gemfile block](https://bundler.io/guides/bundler_in_a_single_file_ruby_script.html)
was 0.3.0 but my system had a more recent version (0.3.1). 

```ruby
require 'bundler/inline'
gemfile do
  gem 'kramdown', '2.4.0'
  gem 'rss', '0.3.0'
end
```

After fixing this with a quick edit in a text editor, I was able to get
the project built immediately. That is wruby. A program that generates a 
new folder called `build`. This folder contains a website, ready to be 
deployed.


```python
python3 -m http.server --directory build
```

I used the only one-liner command I can reliably recall for starting 
up a local server and the built site was served over port 8000. Awesome.

To start writing new content you must create new markdown files inside 
a `posts` folder, with no expected format for the filename. To modify
the content structure there are two HTML files, header and footer. 
Everything else is handled by `wruby.rb`, a program that in one file
declares several functions to parse markdown, concatenate HTML 
fragments and handle the reading and writing of files, including
an RSS feed. All of this built-in!



<div style="text-align: center; padding: 1rem;" >
&mdash;&mdash;&mdash;
</div>

Following Bradley's footsteps, today I began work on a one-file static 
site generator tentatively called Arrow[^1]. The goal is to eventually handle
the maintenance of this website through it.

[^1]: Name subject to change.

The work so far has been exploratory. I cloned the 
[wruby repository](https://git.sr.ht/~bt/wruby) and spent
most of today deploying a site created with wruby to Github Pages. I
programmed this process into a Rake task, moving away from 
[Make](https://www.gnu.org/software/make/) to maintain the goal of
being platform agnostic.

Next, I'll be creating a Content Management System with Rake,
since it will be the simplest way to manage cross-platform repeatable tasks such
as creating a new post, building the site, and deploying to Github 
Pages. 

I'll leave the `config.yml` file alone, but I'll remove the need to
prefix an underscore since that's a Jekyll convention.

I expect to rewrite the entire application from scratch in the coming
days, but I wanted to mention Bradley's project 
first both for its influence on mine as well as to "give people options for tools they can set up and use". 
You can see some sites that are already using wruby [here](https://wruby.btxx.org/websites).

Its biggest contribution to the design of my 
static site generator will be its reminder of the 
[Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy#Origin).
wruby does one thing and it does it well. It takes a series of files
and outputs a folder ready to be deployed. 

For the deployment stage, I'll be relying on 
Github Pages for hosting. 

CMS will be handled through git and rake, while
site generation will be all Ruby with the fewest 
amount of dependencies possible. 





