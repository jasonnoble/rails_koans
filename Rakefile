require 'pivotal-tracker'
require 'csv'

PivotalTracker::Client.token = ENV['TRACKER_TOKEN'] || 'jkfduisj97823974j2kl24899234'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

autoload :RailsKoans, 'rails_koans'

namespace :rails_koans do
  task :check_pivotal_tracker do
    begin
      PivotalTracker::Client.connection
    rescue PivotalTracker::Client::NoToken
      puts <<EOF


  You need to obtain a Pivotal Tracker API Token and export it in your environment
  as TRACKER_TOKEN.

    curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v3/tokens/active

  Copy the guid field and export it

    export TRACKER_TOKEN='c93f12c71bec27843c1d84b3bdd547f3'

  Then run your rake command again

EOF
      exit
    end
  end

  desc "Create project to walk through Rails Tutorial (http://ruby.railstutorial.org/)"
  task :rails_tutorial => :check_pivotal_tracker do
    project = RailsKoans.create_project(:name => "Rails Koans ##{rand(1000000).to_i}")
    stories = CSV.read("projects/rails_tutorial_demo_app.csv")
    # Shift to get rid of the header row
    stories.shift
    stories.reverse.each do |row|
      name = row.shift
      description = row.join(' ')
      next if name == ''
      project.stories.create(
          :name => name,
          :description => description,
          :story_type => 'feature',
          :estimate => 1
      )
    end
    puts "\n\n\nYour Koan is available at https://www.pivotaltracker.com/projects/#{project.id}\n\n\n"
  end
end