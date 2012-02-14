require 'spec_helper'

describe RailsKoans do
  describe '#create_project' do
    it 'should create a new project' do
      @project = RailsKoans.create_project(:name => 'My Project')
      @project.name.should == 'My Project'
    end
  end
end