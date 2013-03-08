module ActsAsModelWithStatus::InstanceMethods

  def status
    status_key read_attribute(:status)
  end

  def status= key
    write_attribute :status, status_value(key)
  end


  private

  def status_key(value)
    invert_available_statuses[value]
  end

  def status_value(key)
    available_statuses[key]
  end

end
