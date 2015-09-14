require 'json'
require 'optparse'
require 'fileutils'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: rgen.rb [options]"

  opts.on("-c", "--config CONFIGFILE", "Specify Config file") do |c|
    options[:config_file] = c
  end

  opts.on("-d", "--dest DESTINATIONDIR", "Specify Destination Directory") do |d|
    options[:destination] = d
  end
end.parse!

options[:config_file] ||= "sample.json"

# Create the destination directory if it doesn't exist
raise 'A destination directory must be specified' unless options[:destination]
Dir.mkdir options[:destination] unless File.exists? options[:destination]

file = File.read(options[:config_file])
data = JSON.parse(file)

# Run any pre-commands before copying over template files
# These are run from the destination directory
data["pre-commands"] ||= []
start_dir = Dir.pwd
Dir.chdir(options[:destination])
data["pre-commands"].each do |command|
  `#{command}`
end
Dir.chdir(start_dir)

# Templates can point to a git repo
# or a local directory
#
# They will be applied in the order specified
# in the config files; if there is a file conflict
# the last one in wins.
Dir.mkdir "./rgen_tmp"
data["ignore"] ||= []
data["templates"] ||= []
data["templates"].each do |command|
  if command.match(/http|https/)
    `git clone #{command} rgen_clone_tmp`
    Dir.foreach("rgen_clone_tmp") do |x|
      unless [".", ".."].include?(x)
        FileUtils.mv("rgen_clone_tmp/#{x}", "rgen_tmp/") unless data["ignore"].include?(x)
      end
    end
    FileUtils.remove_dir "rgen_clone_tmp"
  else
    `cp -R #{command} ./rgen_tmp/`
  end
end

#binding.pry
`cp -R ./rgen_tmp/ #{options[:destination]}`

# Running any post commands that should come after the
# templates are copied
data["post-commands"] ||= []
start_dir = Dir.pwd
Dir.chdir(options[:destination])
data["post-commands"].each do |command|
  `#{command}`
end
Dir.chdir(start_dir)

`rm -rdf ./rgen_tmp`
