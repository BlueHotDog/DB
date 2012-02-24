require_relative 'schema.rb'

module DB
  class Bootstrap

    def initialize

    end

    def setup
      Dir["*.rb"].each {|file| require_relative file }
    end

    def schema
      @schema ||= DB::Schema.new
    end
  end
end