module ActsAsModelWithStatus::Hook

  def acts_as_model_with_status(*args)
    options = args.extract_options!

    cattr_accessor :available_statuses
    cattr_accessor :invert_available_statuses

    self.available_statuses = {new: 1 , initialized: 2, running: 3, finished: 4, error: 100}
    self.invert_available_statuses = self.available_statuses.invert

    include ActsAsModelWithStatus::InstanceMethods
  end



end
