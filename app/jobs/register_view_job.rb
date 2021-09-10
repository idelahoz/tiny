class RegisterViewJob < ApplicationJob
  queue_as :default

  def perform(token)
    Url.find_by!(token: token).increment!(:visits)
  end
end
