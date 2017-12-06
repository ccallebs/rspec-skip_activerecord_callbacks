require 'byebug'
require "rspec/skip_activerecord_callbacks/version"

module RSpec
  module SkipActiveRecordCallbacks
    def self.included(base)
      base.extend(ClassMethods)      
    end

    module ClassMethods
      def skip_callback!(klass, event, func)
        time, event = event.to_s.split('_').map(&:to_sym)

        around(:each) do |example|
          klass.skip_callback(event, time, func)
          example.run
          klass.set_callback(event, time, func)
        end
      end
    end
  end
end

RSpec.configure { |c| c.include RSpec::SkipActiveRecordCallbacks }