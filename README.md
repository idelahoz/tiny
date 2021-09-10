# Project

[project.com](https://project.com)

## Install

### Clone the repository

```shell
git clone git@github.com:idelahoz/tiny.git
cd tiny
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.2`

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create db:migrate
```

## Serve

```shell
rails s
```

## Usage
To start using the app go to the local page, usually: http://localhost:3000

You'll see a page to create a new url. After creating it you can use it with a url like: http://localhost:3000/abc123 and it will redirect you to the specified url.
