# Devlog

<div style="background: #ddd; padding: 1rem">

  <p>This is the development log (<em>devlog</em>) of Arrow. 
  I like keeping a log of my impressions 
  regarding different technologies as I work on software projects.</p>

  <p>This is not part of Arrow's documentation. Instead, devlogs capture 
  the history of a project by telling a story from the developer's perspective.</p>
</div>


## 2024-09-04

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

