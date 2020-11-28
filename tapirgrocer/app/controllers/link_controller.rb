class LinkController < ApplicationController
  require 'rqrcode'
  def index
    @qr = RQRCode::QRCode.new("http://tahmidrahman.com/taprigrocer/app/views/entries/new")
    # @qr = RQRCode::QRCode.new("http://localhost:3000/taprigrocer/app/views/entries/new")
# With default options specified explicitly

  end 
end
