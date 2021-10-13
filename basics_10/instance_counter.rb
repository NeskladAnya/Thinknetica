module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end

    protected

    def increase_instance
      self.instances += 1
    end
  end

  module InstanceMethods
    def register_instance
      self.class.send :increase_instance
    end
  end
end
