# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  poll_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = FactoryGirl.create(:question)
  end

  subject{ @question }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:poll_id) }

  # Associations
  it { should respond_to(:poll) }
  it { should respond_to(:choices) }

  # Validations
  it 'should have a title' do
    @question.title = nil

    @question.should_not be_valid
  end

  it 'should have at least two valid choices' do
    @question.choices = []

    @question.should_not be_valid
  end
end
