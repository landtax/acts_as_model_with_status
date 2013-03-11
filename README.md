# ActsAsModelWithStatus

## Description

This `acts_as_model_with_status` extension provides the capabilities handling objects status in ActiveRecord Models.  The class that has this specified needs to have a `status` column defined on the mapped database table.

Status values are managed as symbols but in the database are stored as
integers.

## Installation

In your Gemfile:

    gem 'acts_as_model_with_status'

Or, from the command line:

    gem install acts_as_model_with_status

## Example

At first, you need to add a `status` column to desired table:

    rails g migration AddStatusToJob status:integer
    rake db:migrate
    
After that you can use `acts_as_model_with_status` method in the model: 

```ruby
class Job < ActiveRecord::Base
  acts_as_model_with_status {:new => 1, :running => 2, :finished => 3, :error => 99}, :default => :running
end
    
job.status
# -> :running

job.status = :finished
job.status
# -> :finished
    
```

## Class Methods Added To ActiveRecord Models

- available_statuses
- invert_available_statuses
- status_column

## Roadmap

1. Add `status?` accessors (running?, new?)
2. Scopes
3. Reduce requirements (ActiveRecord 2, Rails 2...)

## Contributing to `acts_as_model_with_status`
 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
- Fork the project
- Start a feature/bugfix branch
- Commit and push until you are happy with your contribution
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Thanks to
- http://www.iula.upf.edu. Universitat Pompeu Fabra. Institut Universitari de Lingüística Aplicada (IULA) 
- https://github.com/swanandp This readme is almost a copy :)

## Copyright

Copyright (c) 2013 Santi Bel, released under the MIT license
