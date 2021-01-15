require 'rails_helper'

describe Operation do
  describe 'relationships' do
    it {should belong_to :doctor}
    it {should belong_to :surgery}
  end
end
