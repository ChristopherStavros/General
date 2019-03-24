# Step by step

1. Set up [Heroku](https://dashboard.heroku.com) account
1. Install [Heruko CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
    ```bash
    $ sudo snap install --classic heroku
    ```
1. Login
    ```bash
    $ heroku login

    heroku: Press any key to open up the browser to login or q to exit: 
    ```
1. Create app
    ```bash
    $ heroku create steezcorp

    Creating ⬢ steezcorp... done
    https://steezcorp.herokuapp.com/ | https://git.heroku.com/steezcorp.git
    ```
1. List apps (optional)
    ```bash
    $ heroku apps
    ```
1. View [app](https://steezcorp.herokuapp.com/) in browser (optional)

1. Install **gunicorn** in your virtual environment

    ```bash
    $ pip install gunicorn
    ```

1. Add requirements.txt to project if it does not exist

    ```bash
    $ pip freeze > requirements.txt # or venv/bin/pip freeze > requirements.txt
    ```

1. Add Procfile (no file extension) to project root and add the following text
   - web: gunicorn scriptName_wNoExtension:app

    ```bash
    $ echo web: gunicorn app:app >> Procfile
    ```

1. Add runtime.txt in your project root and add the Python [runtime](https://devcenter.heroku.com/articles/python-runtimes) you want your app to run  
**NOTE** : Must be a [Heroku supported Python runtime](https://devcenter.heroku.com/articles/python-support#supported-runtimes) 

    ```bash
    $ echo python-3.6.8 >> runtime.txt
    ```

1. Initialize git repo

    ```bash
    $ git init
    ```

1. Create .gitignore file and add venv folder name

    ```bash
    $ echo venv >> .gitignore
    ```

1. Stage and commit project filesfiles

    ```bash
    $ git add -A
    $ git commit -m "First commit"
    ```

1. Point to Heroku app

    ```bash
    $ heroku git:remote --app steezcorp
    ```

1. Push to Heroku remote

    ```bash
    $ git push heroku master
    ```

1. Open app

    ```bash
    $ heroku open # or just browse to URL directly
    ```

1. Get Heroku info (optional)

    ```bash
    $ heroku info
    ```

1. View Heroku logs (optional)

    ```bash
    $ heroku logs # or heroku logs --tail
    ```
# Heroku Commands

```bash
CLI to interact with Heroku

VERSION
  heroku/7.22.4 linux-x64 node-v11.10.1

USAGE
  $ heroku [COMMAND]

COMMANDS
  access          manage user access to apps
  addons          tools and services for developing, extending, and operating your app
  apps            manage apps on Heroku
  auth            check 2fa status
  authorizations  OAuth authorizations
  autocomplete    display autocomplete installation instructions
  buildpacks      scripts used to compile apps
  certs           a topic for the ssl plugin
  ci              run an application test suite on Heroku
  clients         OAuth clients on the platform
  config          environment variables of apps
  container       Use containers to build and deploy Heroku apps
  domains         custom domains for apps
  drains          forward logs to syslog or HTTPS
  features        add/remove app features
  git             manage local git repository for app
  help            display help for heroku
  keys            add/remove account ssh keys
  labs            add/remove experimental features
  local           run heroku app locally
  logs            display recent log output
  maintenance     enable/disable access to app
  members         manage organization members
  notifications   display notifications
  orgs            manage organizations
  pg              manage postgresql databases
  pipelines       groups of apps that share the same codebase
  plugins         list installed plugins
  ps              Client tools for Heroku Exec
  psql            open a psql shell to the database
  redis           manage heroku redis instances
  regions         list available regions for deployment
  releases        display the releases for an app
  reviewapps      disposable apps built on GitHub pull requests
  run             run a one-off process inside a Heroku dyno
  sessions        OAuth sessions
  spaces          manage heroku private spaces
  status          status of the Heroku platform
  teams           manage teams
  update          update the Heroku CLI
  webhooks        setup HTTP notifications of app activity
  ```

