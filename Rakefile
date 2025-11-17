# -*- ruby -*-

version = File.read(File.join(__dir__, "init.rb"))[/version '(.+?)'/, 1]

desc "Tag #{version}"
task :tag do
  sh("git", "tag",
     "-a", "v#{version}",
     "-m", "#{version} has been released!!!")
  sh("git", "push", "--tags")
end

desc "Release #{version}"
task release: :tag
