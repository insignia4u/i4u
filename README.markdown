[![Code Climate](https://codeclimate.com/github/insignia4u/i4u.png)](https://codeclimate.com/github/insignia4u/i4u)

# Insignia Site i4u  

## Dependences:

 - DBMS: Postgresql, MySQL or SQLite.
 - Ruby: ruby-1.9.3-p0
 - ImageMagick

## Get the repository with:

```bash
  $ git clone git@github.com:insignia4u/i4u.git
```
## Preconfigurations

If you use rvm may want to copy the sample file that sets the version of ruby and gemset suitable for this project:
```bash
  $ cp ./i4u/.rvmrc.sample ./i4u/.rvmrc
```
If you have not installed version of Ruby 1.9.3-p0 must install it with:
```bash
  $ rvm install ruby-1.9.3-p0
```
Then go to the project folder and accept the security confirmation.
```bash
  $ cd i4u/
```
You can use the database engine of your choice, this should add the proper dependencies in Gemfile. For example if you use mysql in the development environment, you must add the gem mysql2 in group development.

You must also make the appropriate settings to access the file database.yml bd. This can be guided with the sample file attached. Copy it and load it with the appropriate data
```bash
  $ cp config/database.yml.example config/database.yml
```
Then install the dependencies with:
```bash
  $ bundle install
```
Create and run database migrations:
```bash
  $ rake db:create
  $ rake db:migrate
```
To load the sample data will need to add some pictures:
  - i4u/public/populate_images: 1.JPG, 2.JPG, ... , 20.JPG
  - i4u/public/populate_images/faces: 1.JPG, 2.JPG, ... 5.JPG

Finally load test data:
```bash
  rake db:populator:load
```
Now you can start the server and test the Web at http://localhost:3000/
```bash
  rails s
```