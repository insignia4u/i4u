require 'spec_helper'

describe SiteSection do
  describe "attributes accessibility" do
    it { should     respond_to(:name) }
    it { should     respond_to(:url) }
  end

  describe "validations" do
    it { should validate_presence_of(:site) }
  end
end
