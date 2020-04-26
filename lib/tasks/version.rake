def valid? version
  pattern = /^\d+\.\d+\.\d+(\.(\w+))?$/
  raise "Tried to set invalid version: #{version}" unless version =~ pattern
end

def correct_version(version)
  major, minor, tiny, pre = version.split('.')

  [major.to_i, minor.to_i, tiny.to_i, pre].compact.join('.')
end

def set_pre(version, flag)
  major, minor, tiny, pre = version.split('.')

  pre = flag

  [major, minor, tiny, pre].compact.join('.')
end

def read_version
  begin
    File.read('VERSION').strip
  rescue
    raise "VERSION file not found or unreadable."
  end
end

def write_version(version)
  valid? version
  begin
    File.open 'VERSION', 'w' do |file|
      file.write correct_version(version)
    end
  rescue
    raise "VERSION file not found or unwritable."
  end
end

def reset(current, which)
  v = current.split('.')

  which.each do |part|
    if part == 3 # set pre flag to nil
      v[part] = nil
    else
      v[part] = 0
    end
  end

  v.compact.join('.')
end

def increment(current, which)
  v = current.split('.')

  v[which] = v[which].to_i + 1

  v.compact.join('.')
end

desc "Prints the current application version"
version = read_version
task :version do
  puts <<HELP
Available commands are:
-----------------------
bundle exec rake version:write[version] # set custom version in the x.x.x.pre format
bundle exec rake version:pre[flag]      # set pre with flag x.x.x.flag
bundle exec rake version:tiny           # increment tiny and reset pre x.x.x+1
bundle exec rake version:minor          # increment minor and reset tiny x.x+1.0
bundle exec rake version:major          # increment major and reset others x+1.0.0
HELP
  puts "Current version is: #{version}"
end

namespace :version do

  desc "Write version explicitly by specifying version number as a parameter"
  task :write, [:version] do |task, args|
    write_version args[:version].strip
    puts "Version explicitly written: #{read_version}"
  end

  desc "Add a pre flag"
  task :pre, [:flag] do |task, args|
    new_version = set_pre(read_version, args[:flag])
    write_version new_version
    puts "Application flagged: #{new_version}"
  end

  desc "Increments the tiny version and resets pre"
  task :tiny do
    incremented = increment read_version, 2
    new_version = reset incremented, [3]
    write_version new_version
    puts "Application patched: #{new_version}"
  end

  desc "Increments the minor version and resets tiny and pre"
  task :minor do
    incremented = increment read_version, 1
    new_version = reset incremented, [2, 3]
    write_version new_version
    puts "New version released: #{new_version}"
  end

  desc "Increments the major version and resets minor, tiny, and pre"
  task :major do
    incremented = increment read_version, 0
    new_version = reset incremented, [1, 2, 3]
    write_version new_version
    puts "Major application version change: #{new_version}. Congratulations!"
  end
end
