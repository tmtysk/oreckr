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
* ruby (>= 1.9.3), bundler, vagrant (>=1.1) and Virtualbox

### How to boot dev-server

    $ git clone https://github.com/tmtysk/oreckr.git
    $ cd oreckr
    $ cd chef-repo
    $ bundle
    $ librarian-chef install
    $ cd ..
    $ vagrant up
    $ vagrant ssh
    $ cd /vagrant
    $ bundle install --path vendor/bundle
    $ bundle exec rake db:migrate
    $ bundle exec rails s

And then, access the application home (http://localhost:63000) and set the credentials of AWS and S3-bucket name.

You can check your AWS credentials at: https://portal.aws.amazon.com/gp/aws/securityCredentials

## Known Issues

* Automated setting of Cloudfront/Glacier has not been implemented yet.
* failed to display template used by jquery-fileupload-rails.

This project is under development but you can customize as you like!

Enjoy!

Copyright (c) 2012-2013 tmtysk, released under the MIT license.
