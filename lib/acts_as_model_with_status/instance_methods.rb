module ActsAsModelWithStatus::InstanceMethods

  def status
    status_key read_attribute(self.status_column.to_sym)
  end

  def status= key
    validate_status key

    write_attribute(self.status_column.to_sym, status_value(key))
  end

  private

  def set_default_status_if_needed
    if self.status.nil? && !self.default_status.nil?
      self.status = self.default_status 
    end
  end

  def status_key(value)
    invert_available_statuses[value]
  end

  def status_value(key)
    validate_status key

    available_statuses[key]
  end

  def validate_status(key)
    if !available_statuses.keys.include? key
      raise "Invalid status ':#{key}'" 
    end
  end

end
