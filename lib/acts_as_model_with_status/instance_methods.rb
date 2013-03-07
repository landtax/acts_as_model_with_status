module ActsAsModelWithStatus::ClassMethods

  def status
    status_id = read_attribute :status
    @_invert_statuses[status_id] if status_id
  end

  def status= value
    status_id = @_statuses[value]
    write_attribute :status, status_id  if status_id
  end

  def initialized?
    status == :initialized
  end

  def running?
    status == :running
  end

  def finished?
    status == :finished
  end

  def error?
    status == :error
  end

end
