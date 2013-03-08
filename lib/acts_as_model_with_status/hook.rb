module ActsAsModelWithStatus::Hook

  def acts_as_model_with_status(status_list, *args)
    options = args.extract_options!

    cattr_accessor :available_statuses
    cattr_accessor :invert_available_statuses
    cattr_accessor :status_column
    cattr_accessor :default_status

    self.available_statuses = status_list
    self.invert_available_statuses = self.available_statuses.invert
    self.status_column = options[:column] || :status
    self.default_status = options[:default]

    include ActsAsModelWithStatus::InstanceMethods

    after_initialize :set_default_status_if_needed
  end

end
