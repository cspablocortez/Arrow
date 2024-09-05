require 'bundler/inline'
require 'yaml'
require 'fileutils'

gemfile do
  gem 'kramdown'
end

# First Approach:

# For every file in a given directory, 
# recursively, convert every markdown file 
# into an html file, and then take that 
# html content and insert it into an ERB template.


# Second Approach:

# Create an Arrow object that accepts a config.yml file with default site values.

# The first method uses the config file to create working links.


data = YAML.load_file('config.yml')


def convert_markdown_to_html(directory = '.', template_file = 'default.html.erb', build_dir = 'build')
  
  FileUtils.mkdir_p(build_dir)

  Dir.glob("#{directory}/**/*.md").each do |markdown_file|

    # Convert markdown content to HTML
    markdown_content = File.read(markdown_file)
    html_content = Kramdown::Document.new(markdown_content).to_html

    page_title = markdown_content.match(/^# (.+)$/) ? $1 : "Untitled"

    # Load the ERB template
    template = File.read(template_file)
    erb_template = ERB.new(template)

    # Render the template with the HTML content, page title, and footer

    rendered_html = erb_template.result_with_hash(page_title: page_title, content: html_content)

    # Define output path and filename in the build directory
    relative_path = markdown_file.sub(directory, '') # Get relative path from base directory

    puts "relative_path: #{relative_path}"

    output_file = File.join(build_dir, relative_path.sub('.md', '.html'))

    puts "output_file: #{output_file}"

    # Ensure the directory for the output file exists
    output_dir = File.dirname(output_file)
    FileUtils.mkdir_p(output_dir)

    # Write the final HTML output to the file
    File.write(output_file, rendered_html)

    puts "Converted: #{markdown_file} -> #{output_file}"
  end
end


convert_markdown_to_html


