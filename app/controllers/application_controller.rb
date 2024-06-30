class ApplicationController < ActionController::Base
  add_flash_types :info, :warning, :danger, :success

  def set_title(title = nil)
    @title = title || "ReMarkable Movies"
  end
end
