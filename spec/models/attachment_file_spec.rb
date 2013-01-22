require 'spec_helper'

describe AttachmentFile do

  it "has a valid factory" do
    create(:attachment_file).should be_valid
  end

  it "is invalid with a duplicate name" do
    create(:attachment_file, name: 'attachment file')
    build( :attachment_file, name: 'attachment file').should_not be_valid
  end
end
