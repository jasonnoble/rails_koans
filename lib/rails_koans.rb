require 'pivotal-tracker'

class RailsKoans
  class << self
    def create_project(options = { })
      project = PivotalTracker::Project.new(options)
      project = project.create
      project
    end
  end
end