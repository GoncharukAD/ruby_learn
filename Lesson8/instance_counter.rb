# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.class_variable_set :@@count_instances, 0
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def  instances
      class_variable_get :@@count_instances
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.class_variable_set :@@count_instances, (self.class.class_variable_get(:@@count_instances) + 1)
    end
  end
end
