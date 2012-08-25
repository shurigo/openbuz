class PagesController < ApplicationController
  def search
    @title = "Find a job"
  end

  def view
    @title = "View job"
  end

  def apply
    @title = "Apply to the job"
  end

  def profile
    @title = "View profile"
  end
end
