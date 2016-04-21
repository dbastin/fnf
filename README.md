[![Build Status](https://travis-ci.org/dbastin/fnf.svg?branch=master)](https://travis-ci.org/dbastin/fnf)

Kazoo - Friends & Family
========================

This is an implementation of a hypothetical friends & family lending product for a hypothetical company called Kazoo Finance.

It has the ability for someone to ask to have a loan funded and for other users to come together to fund it. 

Functionality is presentely limited in the following ways:

* Borrowers currently cannot be Lenders (using the same account). You're either one or the other. Using single table inheritance STI here was an implementation optimization that will need to be changed to better match reality.
* Needs some more authorization. Some scary holes.
* There are no notifications. We need some notification emails sent out at various points in the process.
* It doesn't handle loan payments. Marketing blurb waves hands toward using Venmo, Paypal, and Square Cash. 
* It doesn't resolve payment disputes between Lenders and Borrowers.
* It doesn't automatically collect Kazoo's service fee once a loan is fully funded.
* English tense for UI text needs improving for loans in the past.
* Of course, the UI design and styling needs a lot of work. 

Installation
------------

* Install ruby
* Install bundler
* Clone the repository

```
$ cd fnf && bundle
```

```
$ bundle exec rake db:drop db:create db:migrate
```

``` 
$ rails s
```

Check out the app running on http://localhost:3000 using your browser. Enjoy.

Developers
----------

``` 
$ bundle exec rake 
```

100% code coverage.

```
$ bundle exec rake db:seed
```

Some test data. Try logging in with fred@example.com/123123 (a Borrower), or jessica@example.com/123123 (a Lender).

We could use some integration tests. Nothing too hard-core. Let's start with some "happy day" scenarios.

Contributing
-------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.
