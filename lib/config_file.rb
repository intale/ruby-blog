# Helper module (used across projects) to provide easy config file functionality.
module ConfigFile

  def config
    self.class.config
  end

  module ClassMethods
    def has_config(filename, options={})
      @config_file_name = filename
    end

    def config
      @config ||= HashWithIndifferentAccess.new(YAML.load_file(config_file))[Rails.env]
    end

    def config_file
      filename = File.join(Rails.root,'config',@config_file_name)
      raise "config/#@config_file_name not found!" unless File.exists?(filename)
      filename
    end

  end

  def self.included(klass)
    klass.send :extend, ClassMethods
  end

end