class WelcomeController < ApplicationController
  def index
    @cancellations = Cancellation.all
  end
end
