require 'yaml'
require 'erb'

CONFIG_FILE = 'values.yaml'.freeze
TEMPLATE_FILE = 'template.yaml'.freeze

config = YAML.safe_load(File.open(CONFIG_FILE, 'r'))
global = config['global']

config['values'].each do |value|
  name = value.keys[0]
  params = value[name]
  yaml = ERB.new(File.read(TEMPLATE_FILE)).result(binding)
  YAML.dump(YAML.safe_load(yaml), File.open("../workflows/#{name}.yaml", 'w'))
end

