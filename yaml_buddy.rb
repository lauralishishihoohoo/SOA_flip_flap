# frozen_string_literal: false

require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with yaml data into @data
  # parameter: yaml - a String in yaml format
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
end
