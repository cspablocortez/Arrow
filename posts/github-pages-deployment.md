# How to Deploy to Github Pages

2024-09-04

<p style="background: #ddd; padding: 1rem">
  This guide assumes you have a Github account.
</p>


## Creating a website build

Open the terminal to the project directory 
and create a ready-for-deployment folder of your 
website by running the following command.

~~~sh
$ make build
~~~

This will create a folder called `build/` in your root folder.

To see your site on a local server before deployment, you can 
also run:

~~~sh
$ make serve
~~~

This command will build the project and start a local server
using Python's `http-server`, which uses port 8000 by default.

You can see a local copy of your project by visiting to 
<http://localhost:8000> with your web browser.


You should see something like this:

![Screenshot of local server running](/public/images/deployment1.png "Screenshot of local server running.")  

## Deployment

If the website looks good and you are ready to deploy to 
Github Pages, follow these steps.

### Create a `gh-pages` branch in your project repository.

~~~sh
$ git checkout --orphan gh-pages
~~~

The `--orphan` flag in the command above disconnects the newly created branch
from the previous repository history.

### Track the `build` folder on the `gh-pages` branch.

~~~sh
$ git add -f build/
~~~

The `-f` option forces tracking even though the directory is in my `.gitignore` file.

### Lastly, commit and push changes

~~~sh
$ git commit -m "Add build directory to repository"
~~~

~~~sh
$ git push origin gh-pages
~~~

All done! Your site should now be deployed to
`https://github.com/username/repository-name`.

## Updating Site

The previous process applies only to the first time you wish to publish.

For subsequent changes, simply run the `make publish` command from the terminal.

If all went well, you should see a message on the terminal that shows the 
project was deployed successfully.

Wait about a minute or so for Github to update these changes on their server, and 
you should be able to see your site at the address logged on the terminal.

That's it!


