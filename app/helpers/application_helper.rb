require 'digest/md5'

module ApplicationHelper
  def require_authorized_key 
    secret = LepusServer::Application.config.SECRET_KEY
    redirect_to :status => 403 unless Digest::MD5.hexdigest(params[:data] + secret) == params[:data_hash]
  end
end
