require "sinatra/base"
require "mustermann"

module Nex
  class Web < Sinatra::Base
    get "/packages/:name" do |name|
      if system "wget", "--quiet", "https://repo.hex.pm/packages/#{name}", chdir: "public/packages"
        send_file "public/packages/#{name}"
      else
        not_found
      end
    end

    get "/tarballs/:filename" do |filename|
      if system "wget", "--quiet", "https://repo.hex.pm/tarballs/#{filename}", chdir: "public/tarballs"
        send_file "public/tarballs/#{filename}"
      else
        not_found
      end
    end
  end
end
