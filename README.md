# Oreckr

Experimental project of owned-photo-storage-service using on AWS.

## Subject

* Saving cost of storage for photos by using AWS S3/Glacier.
* Faster photo-browsing environment by using AWS Cloudfront.
* Simple and Easy to use.

## Usage

### Requirement

* User accounts of services below
  * Amazon Web Service
  * heroku
* Ruby-1.9.3 and bunder/heroku gem.

### How to deploy

    $ git clone https://github.com/tmtysk/oreckr.git
    $ cd oreckr
    $ heroku create
    $ heroku addons:add newrelic:standard
    $ RAILS_ENV=production bundle exec rake assets:precompile
    $ git add .
    $ git commit -m "precompiled assets"
    $ git push heroku master
    $ heroku run rake db:migrate

And then, access the application home page and set the credentials of AWS and S3-bucket name.

You can check your AWS credentials at: https://portal.aws.amazon.com/gp/aws/securityCredentials

## Known Issues

* Automated setting of Cloudfront/Glacier has not been implemented yet.


This project is under development but you can customize as you like!

Enjoy!

Copyright (c) 2012 tmtysk, released under the MIT license.
