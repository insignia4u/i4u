Insignia Official Site
=======

Dependencies
-------

 - Ruby 1.9.3 (pathlevel 545)
 - Bundler 1.5.3
 - Rails 3.2.18
 - SQLite3
 - Imagemagick

Quick start
-------

If you satisfy all the dependencies you can clone the repository via git:

```
$ git clone git@github.com:insignia4u/i4u.git
```

And then go to your project folder and run:

```
$ bundle install
```

You also have to set up all environment variables and config your database settings, you can do it creating the following files (we have created sample files inside config folder as an example):

```
i4u/
└── config/
    └── database.yml   -> Default connection to DB.
```

Populate the database:

```
$ rake db:seed
$ rake db:populator:load
```

Now you can start the server:

```
$ rails s
```

Then point your browser to **http://localhost:3000**, and start using the app!


Install Dependencies
-------
- **Ruby & Rails**

    If you don't have Ruby or Rails, I recommend you to use [rvm][1] to manage your Ruby versions and gems; you can follow instructions based on your operating system [here][2].


Coding Style
------
 - Use two spaces for indentation, not tabs.
 - Avoid trailing spaces.
 - Be sure all your specs are passing before pushing any commits to origin.

Testing
-------

We are using Capybara and Rspec for tests, both works out of the box once you run the bundle command. There is only one thing to consider: test files are under the `spec/` directory.

It's worth to mention that all features must provide a feature spec and model specs, all at green state.

This application is set up to skip the generation of controller specs, assets and helpers.

Contributing
-------

If you are going to contribute, clone the repo and make a pull request.

[1]: https://rvm.io/rvm/install
[2]: http://railsapps.github.io/installing-rails.html
