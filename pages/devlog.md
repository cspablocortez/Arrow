# Devlog

2024-09-04

[21:10] This page is now live on Github at 
<https://cspablocortez.github.io/Arrow/about>.

I'll be going over some of the required steps I took to get this working.

1. First I had to create a `gh-pages` branch on my repository.

```sh
$ git checkout --orphan gh-pages
```

The `--orphan` flag in the command above disconnects the newly created branch
from the previous repository history.

2. Then I tracked the `build` folder on this branch.

```sh
$ git add -f build/
```

The `-f` option forces tracking even though the directory is in my `.gitignore` file.


3. Commit and push changes

```sh
$ git commit -m "Add build directory to repository"
```

```sh
$ git push origin gh-pages
```

The site is currently deployed successfully. If the site is under a 
project repository, like it is for me (I'm publishing this 
on https://cspablocortez.github.io/Arrow), then the base url will be broken.

Will come back to that.

--- 

[20:43] I'm now preparing the site for a Github Pages deployment.

--- 

[20:32] Linking devlog to home page.

---

[20:30] I'm reading up on Github Pages deployment, currently 
thinking of deploying
this project off the `build` directory all from the main branch. 

This method is probably the easiest, but before I decide on it
I want to explore a more
secure way to serve the site over Github Pages by keeping 
separate branches. Not currently a priority as I haven't deployed at all.

