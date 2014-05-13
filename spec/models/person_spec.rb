require 'spec_helper'

describe Person do
  describe "Validations" do
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:bio) }

    describe "specific" do
      before :each do
        @person = Person.new
      end

      context "length" do
        it "requires name to be unique within site scope" do
        @person.bio = ""
        301.times{ @person.bio += "a" }
        @person.should_not be_valid
        @person.should have_at_least(1).errors_on(:bio)
        end
      end
    end
  end

  describe "Person Full Name" do
    it "returns full name" do
      person = FactoryGirl.create(:person, first_name: 'Augusto',
          last_name: 'Pedraza')

      person.full_name.should eq "Augusto Pedraza"
    end
  end
end
