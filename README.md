# Status Site

A Rails engine for creating a quick status application.

## Features

* Creation of Issues - for when you want to tell your users you are aware of an existing issue.

* Updates of Issues - for when you want to add new information to an issue.

* Messages - for notifying users of planned outages

* Message syndication - a javascript widget for showing messages on other sites.

* High level view from New Relic - Color status indication for several metrics.


## Getting Started

* Include the Status Site gem in your Gemfile [TODO: add real example once Gem is published]

    ```
    gem 'status_site', path: "../status_site"
    ```

* Add the following gem dependancies to your Gemfile [TODO: it seems like there has to be a better way to do this, but this is the only way I have been able to get this working]

    ```
    gem 'devise', github: 'idl3/devise', branch: 'rails4' #TODO update this with devise rails 4 support when it is ready
    gem 'activeresource', github: 'rails/activeresource'
    gem 'jquery-rails'
    gem 'slim-rails'
    gem 'turbolinks'
    gem 'draper', '~>1.1.0'
    gem 'newrelic_api'
    ```

* Run the following commands:

    ```
    bundle install
    rails generate devise:install # Follow instructions after install
    status_site_engine:install:migrations
    rake db:migrate
    rails s
    ```

* Add an admin user

    ```
    rails c
    Admin.create(email: 'your@email.com', password: 'password%123')
    ```

* You should now be able to log into your admin account and manage your status site

### New Relic

To take advantage of the New Relic panel ensure the following environment variables are set, you can set these in a `.env` file.

* `NEW_RELIC_API_KEY`
* `NEW_RELIC_APPLICATION_NAME`

### Mailers

Status site allows users to subscribe for updates via email. Make sure you have your mailers configured properly for each environment.

### Messages Widget

Add the follow html snippet to your site in the location your wan the status message displayed it.
You can then add CSS to your stylesheets to style the `div` as needed.

    <div id="status-site-update"></div>
    <script>(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="[path to your status site]/messages/next.js";fjs.parentNode.insertBefore(js,fjs)}}(document,"script","ttm-js"));</script>