# GitHub API on Rails

This is a demo [Ruby on Rails](https://rubyonrails.org/) application that displays user information from the [GitHub API](https://developer.github.com/v3/). The application was built as a learning exercise for the [UC Berkeley Library](http://www.lib.berkeley.edu/).

## Prerequisites

* [Ruby 2.6.0][1]
* [Rails 5.2.2][2]
* [GitHub access token][3] (optional but recommended)
* [Docker][4] (optional for deployment)

[1]: https://www.ruby-lang.org/en/
[2]: https://rubyonrails.org/
[3]: https://github.blog/2013-05-16-personal-api-tokens/
[4]: https://www.docker.com/products/docker-engine

## Local Installation

``
$ git clone git@github.com:rms-ucb/CalDemo.git
$ cd CalDemo
$ bundle install
``

### Configuration

`GITHUB_OATH_ACCESS_TOKEN`: A GitHub API token is recommended in order to avoid API request limits. See [GitHub documentation][3] for more information about creating an access token. Once you have a token, save it to a file with limited access permissions because the token can be used to access your GitHub account.

### Start the application

``
$ GITHUB_OATH_ACCESS_TOKEN="$(cat /path-to-github-access-token)" bin/rails server
``

Open your browser: http://localhost:3000/

### How to run the test suite

``
$ bin/rails test test
``

## Creating a Docker image

### Build

``
$ docker build . --tag cal-demo
``

### Run

``
$ docker run -d -p 3000:3000 -e GITHUB_OATH_ACCESS_TOKEN="$(cat ~/path-to-token)" cal-demo
``

By default, this container will start up the app in "production" mode. To change this, pass the `RAILS_ENV` environment variable (or any other Rails ENV argument) to Docker:

``
$ docker run -d -p 3000:3000 -e RAILS_ENV=development -e GITHUB_OATH_ACCESS_TOKEN="$(cat ~/path-to-token)" cal-demo
``

## Contact

ryan.max.steinberg@gmail.com
