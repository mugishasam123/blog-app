require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @comment = Comment.new(author_id: 11, post_id: 13)
  end

  before { @comment.save }

  it 'if author is present' do
    @comment.author_id = nil
    expect(@comment).to_not be_valid
  end
  it 'if post is present' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end
end
