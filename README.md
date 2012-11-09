# Redu Help-Center

This is the help-center repository for [Redu](www.redu.com.br).

## Setup

### Populate database

First you should create the database, you need the file ``config/database.yml`` with the configurations and run
```shell
rake db:create
rake db:migrate
rake db:test:prepare
```

To populate database just run the rake task:
```shell
rake populate:minimun
```

### Sunspot / Solr
Once Solr server is properly installed you may run it. If you're using
[Sunspot Solr Gem](https://github.com/outoftime/sunspot/tree/master/sunspot_solr#sunspotsolr)
it can be easily done with the following rake task:
```shell
rake sunspot:solr:start # or sunspot:solr:run if you want it on foreground
```
What about if you already have data in your database? Run reindex!
```shell
rake sunspot:reindex
```
To run the tests you should run the server in this environment:
```shell
rake sunspot:solr:run RAILS_ENV=test
```

### Authentication
To create or edit some admin route you should authenticate first. To do this you need a file called ``config/user.yml``:

```yml
user_id: "user"
user_password: "password"
```

### Static assets and AWS

In production mode it's necessary to create a file ``confi/s3.ym`` in order to styc compiled assets to Amazon S3 bucket.

```yml
production:
  access_key_id: 'xxx'
  secret_access_key: 'xxx'
  bucket: 'xxx'
```

More information is avalible [here](https://github.com/rumblelabs/asset_sync).

## Technologies and Versions
* Ruby 1.9.3
* Rails 3.2.5
* MySQL Database Manager
