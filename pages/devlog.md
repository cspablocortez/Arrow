# Devlog

<div style="background: #ddd; padding: 1rem">

  <p>This is the development log (<em>devlog</em>) of Arrow. 
  I like keeping a log of my impressions 
  regarding different technologies as I work on software projects.</p>

  <p>This is not part of Arrow's documentation. Instead, devlogs capture 
  the history of a project by telling a story from the developer's perspective.</p>
</div>

## 2024-09-05

(08:04) Should disable posts since links are currently 
broken.

(07:49) Can't forget to add support for other github pages
projects. That way it's easy to spin more Arrow-built 
projects.

(07:23) Not necessarily *coding*, but I spent the past hours 
writing a blog post about wruby and the shortcomings of 
Jekyll. Arrow needs to be as simple a website as possible 
while introducing a newcomer to the indieweb to important 
concepts, from beginning web development in HTML and CSS to 
generating RSS feeds.

It won't provide configuration beyond metadata, but it will 
be readily configurable by nature, since it will be mostly 
static files.

- external CSS file
- minimal yet opinionanted HTML structure
- CMS that prioritizes writing over file tinkering

## 2024-09-04

(23:54) Next on the todo list is fixing broken links. I think this will require a substantive 
rewrite. I'm going to use wruby as a template, but more likely than not the whole thing will
have to be rewritten. Take a look at this function:

~~~ruby
def generate_full_posts_list(posts, header_content, footer_content, posts_index_file, output_dir, posts_dir)
  posts_index_content = File.read(posts_index_file)
  posts_title = extract_title_from_md(posts_index_content.lines)
  posts_html = Kramdown::Document.new(posts_index_content).to_html

  header = replace_title_placeholder(header_content, posts_title)

  list_content = header + posts_html + "<ul class=\"posts\">\n"
  posts.each { |post| list_content << "<li><span>#{post[:date]}</span><a href='/#{posts_dir}/#{post[:link]}'>#{post[:title]}</a></li>\n" }
  list_content << "</ul>\n" + footer_content

  File.write("#{output_dir}/posts/index.html", list_content)
end
~~~

There's no need to have this many parameters if we create a smart architecture for 
the app. I will use it as a starting point, but I think I'll benefit from checking
out my old code from the Sinatra static site generator I built earlier this year.

---

(22:38) Created a `Rakefile` to ensure compatibility on Windows.

---

(23:27) I have finished adding support for publishing with `make publish`.

---

(22:57) I'm working on setting up the sub url -- This still needs fixing.

---

(21:17) By default, wruby parses code blocks surrounded by tildes 
since it relies on pandoc. I've become accustomed to the Jekyll
backticks, will return to this.

---

(21:10) This page is now [live on Github](https://cspablocortez.github.io/Arrow/devlog).

I'll be going over some of the required steps I took to get this working.

**First I had to create a `gh-pages` branch on my repository.**

~~~sh
$ git checkout --orphan gh-pages
~~~

The `--orphan` flag in the command above disconnects the newly created branch
from the previous repository history.

**Then I tracked the `build` folder on this branch.**

~~~sh
$ git add -f build/
~~~

The `-f` option forces tracking even though the directory is in my `.gitignore` file.


**Lastly, commit and push changes**

~~~sh
$ git commit -m "Add build directory to repository"
~~~

~~~sh
$ git push origin gh-pages
~~~

The site is currently deployed successfully. If the site is under a 
project page, like it is for me (I'm publishing this 
on [https://cspablocortez.github.io/Arrow](https://cspablocortez.github.io/Arrow)), then the base url will be broken.

Since I have a few projects currently hosted via Github Pages,
I will have to come back to fix this.

--- 

(20:43) I'm now preparing the site for a Github Pages deployment.

--- 

(20:32) Linking devlog to home page.

---

(20:30) I'm reading up on Github Pages deployment, currently 
thinking of deploying
this project off the `build` directory all from the main branch. 

This method is probably the easiest, but before I decide on it
I want to explore a more
secure way to serve the site over Github Pages by keeping 
separate branches. Not currently a priority as I haven't deployed at all.

