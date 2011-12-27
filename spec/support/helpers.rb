module Helpers
  def help
    :available
  end

  def allow_mass_assignment_of(model, field)
    model.accessible_attributes.include?(field.to_s)
  end

end
