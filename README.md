# ➿ Leash

![leash.jpeg](./LEASH.jpeg)

Leash is a sample project, which implements web api.

## Requirements

- [Hanami | The web, with simplicity](http://hanamirb.org/) v1.3.1+
- Ruby 2.5.0+

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.2.0/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
