module ActsAsModelWithStatus::Hook

  def acts_as_model_with_status(*options)
    @_statuses = {new: 1 , initialized: 2, running: 3, finished: 4, error: 100}
    @_invert_statuses = @_statuses.invert

    include ActsAsModelWithStatus::InstanceMethods
  end
end
