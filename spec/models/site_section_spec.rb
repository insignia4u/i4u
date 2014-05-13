require 'spec_helper'

describe SiteSection do
  describe "validations" do
    it { should validate_presence_of(:site) }
  end
end
