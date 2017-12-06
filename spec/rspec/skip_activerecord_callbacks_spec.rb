require "spec_helper"
require "byebug"


RSpec.describe RSpec::SkipActiveRecordCallbacks do
  class User
    def self.callbacks_hit
      @@callbacks_hit
    end

    def self.skip_callback(name, *filter_list, &block)
      @@callbacks_hit ||= 1
    end

    def self.set_callback(name, *filter_list, &block)
      @@callbacks_hit += 1
    end
  end

  skip_callback!(User, :before_create, :do_something)

  after(:all) do
    expect(User.callbacks_hit).to eq(2)
  end

  it 'calls appropriate methods' do
    expect(User.callbacks_hit).to eq(1)
  end
end
