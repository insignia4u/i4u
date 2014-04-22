require 'spec_helper'

describe Tip do

  describe "Attributes accessibility" do
    it { should     respond_to(:title) }
    it { should     respond_to(:tip_type) }
    it { should     respond_to(:description) }
    it { should     respond_to(:content) }
    it { should     respond_to(:image) }
    it { should     respond_to(:published_at) }
    it { should     respond_to(:site) }
    it { should     respond_to(:link) }
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:tip_type) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:published_at) }
    it { should validate_presence_of(:link) }
    it { should allow_value('http://foo.com', 'http://bar.com/baz').for(:link) }
    it { should_not allow_value('asdfjkl').for(:link) }

    before(:each) do
      @rails_tip = create(:rails_tip)
      @today_tip = create(:today_tip)
      @rails_tip = build(:rails_tip)
      @today_tip = build(:today_tip)
    end

    context "#only_one_tip_per_day" do
      it "can't create a tip whith the same published_at date and tip_type" do

        expect{ @rails_tip.save }.not_to change { Tip.count }
        expect{ @today_tip.save }.not_to change { Tip.count }
      end
    end
  end

  describe "Factory Definition" do
    it "creates a valid Article" do
      expect{ create(:tip) }.to change{ Tip.count }.by(1)
    end
  end

  describe "Image" do
    before(:each) do
      @tip = Tip.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @tip.should respond_to(:image)
      end

      it "have a paperclip filed named image" do
        @tip.image.should be_an_instance_of(Paperclip::Attachment)
      end
    end
  end

  describe "Callbacks" do
    before(:each) do
      @tip = create(:tip)
    end

    context "#set_published_time_at_beggining_of_day" do
      it "sets the published_at to the beggining of day" do

        @tip.published_at.should eql(Date.today.at_beginning_of_day)
      end
    end
  end

  describe "Finders" do
    before(:each) do
      create_list(:rails_tip_future,2)
      create_list(:today_tip_future,2)
      @old_today_tip = Tip.new(attributes_for(:today_tip,published_at:
                                               2.months.ago))
      @old_today_tip.save(validate: false)
      @old_rails_tip = Tip.new(attributes_for(:rails_tip,published_at:
                                                2.months.ago))
      @old_rails_tip.save(validate: false)
    end

    context "#rails_tip" do
      it "returns a rails tip" do
        @rails_tip = create(:rails_tip)

        Tip.rails_tip.should eql(@rails_tip)
      end
    end

    context "#today_tip" do
      it "returns a today tip" do
        @today_tip = create(:today_tip)

        Tip.today_tip.should eql(@today_tip)
      end
    end

    context "old tips" do
      it "returns the last published tip" do
        Tip.today_tip.should eql(@old_today_tip)
        Tip.rails_tip.should eql(@old_rails_tip)
      end
    end

    context ".month_tips" do
      it "it returns the today tips within a month of a specific date" do
        today_tip = create(:today_tip, published_at: Date.today + 5.month)

        Tip.month_tips(Tip::TODAY_TIP, Date.today + 5.month).should eq([today_tip])
      end

      it "it returns the rails tips within a month of a specific date" do
        rails_tip = create(:rails_tip, published_at: Date.today + 5.month)

        Tip.month_tips(Tip::RAILS_TIP, Date.today + 5.month).should eq([rails_tip])
      end
    end
  end

end
