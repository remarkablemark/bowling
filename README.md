# bowling

Ruby solution for the [Bowling Kata](http://codingdojo.org/kata/Bowling/).

## Install

Prerequisites:
- [Ruby](https://www.ruby-lang.org)
- [Bundler](http://bundler.io)

```sh
$ git clone https://github.com/remarkablemark/bowling.git
$ cd bowling
$ bundle install
```

## Usage

Example of rolling and scoring a perfect game:

```sh
$ irb
> require_relative './lib/Bowling'
> bowling = Bowling.new
> 12.times { bowling.roll(10) }
> bowling.score
=> 300
> exit
```

## Testing

Run unit tests with [rspec](http://rspec.info):

```sh
$ bundle exec rspec --format doc
```

## Docs

Generate docs with [YARD](https://yardoc.org):

```sh
$ bundle exec yard doc
$ open docs/index.html
```

## Layout

```
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── README.md
├── lib
│   └── Bowling.rb
└── spec
    ├── bowling_spec.rb
    └── spec_helper.rb
```

## License

[MIT](https://github.com/remarkablemark/bowling/blob/master/LICENSE)
