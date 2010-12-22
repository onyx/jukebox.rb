require 'fileutils'

class Enabler

  PEOPLE_DIR = File.join([RAILS_ROOT, 'people'])

  def self.state
    all_users = all
    enabled_users = enabled
    Hash[*all_users.zip(all_users.map { |u| enabled_users.include? u }).flatten]
  end

  def self.all
    Dir.entries(JUKEBOX_MUSIC_ROOT).reject { |d| d =~ /\./ }.sort_by { |user| user.downcase }
  end

  def self.enabled
    Dir.entries(PEOPLE_DIR).reject { |d| d =~ /\./ }.sort_by { |user| user.downcase }
  end

  def self.disabled
    (all - enabled)
  end
  
  def self.enable user
    FileUtils.touch File.join(PEOPLE_DIR, user)
  end
  
  def self.disable user
    FileUtils.rm File.join(PEOPLE_DIR, user)
  end
  
end
