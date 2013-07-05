# Sample Capistrano App

## What this is
It's a test app that's been 'capified'; that is, an app that can be deployed via capistrano. Just extract the following files from this app into your own rails app.
* Capfile
* config/deploy.rb
* config/recipes/*

## What this isn't
This isn't really an actual app you'd, like, want to use. What's important in this project are the capistrano deployment files themselves.

## Environment
 * Ubuntu 12.10
 * Deploys Ruby2 via rbenv
 * Deploys NGINX as a proxy
 * Deploys Unicorn as an application (rails) server
 * Deploys Postgresql as a database server
 * Deploys dependencies for those things (ie nodejs for javascript)

## Before you start
 1. Install Ubuntu 12.10 on the box... duh!
 2. Set the Timezone
 ``` 
 dpkg-reconfigure tzdata
 ```
 3. Modify the hostname
 ```
 nano /etc/hosts
 ```
 4. <del>Configure a firewall (perhaps use UFW or something like it)</del>
 Actually, do the firewall after, as the script now installs ufw for you (it just doesn't configure it)
 5. Create a deployment user
 ```
 adduser deployer --ingroup sudo
 ```
 6. As the deployer user, might be worth running this
 ```
 ssh git@github.com
 #should return Permission denied (publickey). - this is expected
 ```
 7. Setup automatic login using your SSH key (from your local machine)
 ```
 cat ~/.ssh/id_rsa.pub | ssh deployer@SERVERNAMEHERE 'cat >> ~/.ssh/authorized_keys'
 ```

## Capistrano Tasks included
 * Run:
 ```cap -T
 ```

## Worth Noting
* config/secret_token.rb is in the .gitignore and, in the file, it looks for an environment variable (i.e. my token isn't on github!).
* config/database.yml is in the .gitignore, it gets created on the fly with a password of your choosing.
* There is a config/constant_data.rb file whereby constants can be setup.
* Much of this based on the work of [Railscast #337](http://railscasts.com/episodes/337-capistrano-recipes). As always, amazing work by [@rbates](https://twitter.com/rbates)

## Assumptions (filled with assumptions, but here are some important ones)
* Assumes your primary domain will be at www.somedomain.com
* Assumes you want redirects from somedomain.com to www.somedomain.com

## License
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.