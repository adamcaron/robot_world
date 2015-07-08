require 'yaml/store'
require_relative 'robot'

class RobotApi
  def self.database
    @database ||= YAML::Store.new("db/robot_collection")
  end

  def self.raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end
end