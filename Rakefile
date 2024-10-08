require 'fileutils'

desc "start development build"
task :dev do 
  FileUtils.rm_rf('build')
  FileUtils.mkdir_p('build')
  sh 'ruby arrow.rb'
  sh 'open build/index.html'
end

desc "Build the project"
task :build do
  FileUtils.rm_rf('build')
  FileUtils.mkdir_p('build')
  sh 'ruby wruby.rb'
end

desc "Serve the project"
task :serve => :build do
  sh 'python3 -m http.server --directory build'
end

desc "Clean the build directory"
task :clean do
  FileUtils.rm_rf(Dir.glob('build/*'))
  puts "build/ directory cleared."
end

desc "Publish to GitHub Pages"
task :publish do
  sh 'git switch gh-pages'

  # Delete everything except .git and build folder
  Dir.glob('*').each do |item|
    FileUtils.rm_rf(item) unless ['.git', 'build'].include?(item)
  end

  # Copy the contents of build/ to root
  FileUtils.cp_r(Dir.glob('build/*'), '.')

  # Remove the build directory
  FileUtils.rm_rf('build')

  # Commit and push changes to GitHub Pages
  sh 'git add .'
  sh 'git commit -m "Automated deployment via rake."'
  sh 'git push origin gh-pages'
  sh 'git switch main'
  
  puts "Deployment to GitHub Pages with rake task 'publish' is complete!"
end

task :default => :serve