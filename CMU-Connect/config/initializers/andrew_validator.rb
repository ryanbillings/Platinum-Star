class AndrewValidator < ActiveModel::EachValidator
  def validates_each(record, attr_name, value)
    begin 
      CMU_Person::find(:id => value)
    rescue
      record.errors.add(attr_name, :andrew, options.merge(:value => value))
    end
  end
end

module ActiveModel::Validations::HelperMethods
  def validates_andrew(*attr_names)
    validates_with AndrewValidator, _merge_attributes(attr_names)
  end
end
