# config/initializers/email_validator.rb
class AndrewValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)   
	begin
	  CMU::Person.find(value)
	rescue
      record.errors.add(attr_name, :andrew, options.merge(:value => value))
    end
  end
end

# This allows us to assign the validator in the model
module ActiveModel::Validations::HelperMethods
  def validates_andrew(*attr_names)
    validates_with AndrewValidator, _merge_attributes(attr_names)
  end
end