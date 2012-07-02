class EnablerController < ApplicationController

  def enable
    Enabler.enable params['user'] if params['user']    
    redirect_to playlist_url
  end

  def disable
    Enabler.disable params['user'] if params['user']    
    redirect_to playlist_url
  end
end
