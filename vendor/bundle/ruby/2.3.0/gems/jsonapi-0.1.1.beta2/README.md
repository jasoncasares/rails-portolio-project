# jsonapi
Ruby gem for parsing/validating [JSON API](http://jsonapi.org) documents.

## Installation

Add the following to your application's Gemfile:
```ruby
gem 'jsonapi'
```
And then execute:
```
$ bundle
```
Or install it manually as:
```
$ gem install jsonapi
```

## Usage

First, `require` the gem.
```ruby
require 'jsonapi'
```

Then, parse a JSON API document:
```ruby
document = JSONAPI.parse(hash_or_json_string)
```

or an [include directive](http://jsonapi.org/format/#fetching-includes):
```ruby
include_directive = JSONAPI::IncludeDirective.new(include_args)
```

## Examples

```ruby
  document = JSONAPI.parse(json_document)
  # Should the document be invalid, the parse method would fail with an
  #   InvalidDocument error.

  document.data.links.defined?(:self)
  # => true
  document.data.links.self.value
  # => 'http://example.com/articles/1'
  document.data.attributes.keys
  # => ['title']
  document.data.attributes.defined?(:title)
  # => true
  document.data.attributes.title
  # => 'JSON API paints my bikeshed!'
  document.data.relationships.keys
  # => ['author', 'comments']
  document.data.relationships.defined?(:author)
  # => true
  document.data.relationships.author.collection?
  # => false
  document.data.relationships.author.data.id
  # => 9
  document.data.relationships.author.data.type
  # => 'people'
  document.data.relationships.author.links.defined?(:self)
  # => true
  document.data.relationships.author.links.self.value
  # => 'http://example.com/articles/1/relationships/author'
  document.data.relationships.defined?(:comments)
  # => true
  document.data.relationships.comments.collection?
  # => true
  document.data.relationships.comments.data.size
  # => 2
  document.data.relationships.comments.data[0].id
  # => 5
  document.data.relationships.comments.data[0].type
  # => 'comments'
  document.data.relationships.comments.links.defined?(:self)
  # => true
  document.data.relationships.comments.links.self.value
  # => 'http://example.com/articles/1/relationships/comments'

  # for the following document_hash
  document_hash = {
    'data' =>
      {
        'type' => 'articles',
        'id' => '1',
        'attributes' => {
          'title' => 'JSON API paints my bikeshed!'
        },
        'links' => {
          'self' => 'http://example.com/articles/1'
        },
        'relationships' => {
          'author' => {
            'links' => {
              'self' => 'http://example.com/articles/1/relationships/author',
              'related' => 'http://example.com/articles/1/author'
            },
            'data' => { 'type' => 'people', 'id' => '9' }
          },
          'comments' => {
            'links' => {
              'self' => 'http://example.com/articles/1/relationships/comments',
              'related' => 'http://example.com/articles/1/comments'
            },
            'data' => [
              { 'type' => 'comments', 'id' => '5' },
              { 'type' => 'comments', 'id' => '12' }
            ]
          }
        }
      }
    }
```

## Contributing

1. Fork the [official repository](https://github.com/beauby/jsonapi_parser/tree/master).
2. Make your changes in a topic branch.
3. Send a pull request.

Notes:

* Contributions without tests won't be accepted.
* Please don't update the Gem version.

## License

jsonapi is Copyright © 2016 Lucas Hosseini.

It is free software, and may be redistributed under the terms specified in the
[LICENSE](LICENSE) file.
