require "spec_helper"

class Zucy::Routing::Router
  attr_reader :route_data

  def draw(&block)
    instance_eval(&block)
    self
  end
end

describe Zucy::Routing::Router do
  def draw(&block)
    router = Zucy::Routing::Router.new
    router.draw(&block).route_data
  end

  context "endpoints" do
    context "get '/photos', to: 'photos#index'" do
      subject do
        draw { get "/photos", to: "photos#index" }
      end

      route_data = { path: "/photos",
                     pattern: [%r{^/photos$}, []],
                     klass_and_method: ["PhotosController", :index]
                   }

      it { is_expected.to eq route_data }
    end

    context "get '/photos/:id', to: 'photos#show'" do
      subject do
        draw { get "/photos/:id", to: "photos#show" }
      end

      route_data = { path: "/photos/:id",
                     pattern: [%r{^/photos/(?<id>[^/?#]+)$}, ["id"]],
                     klass_and_method: ["PhotosController", :show]
                   }

      it { is_expected.to eq route_data }
    end

    context "get '/photos/:id/edit', to: 'photos#edit'" do
      subject do
        draw { get "/photos/:id/edit", to: "photos#edit" }
      end

      regexp = %r{^/photos/(?<id>[^/?#]+)/edit$}
      route_data = { path: "/photos/:id/edit",
                     pattern: [regexp, ["id"]],
                     klass_and_method: ["PhotosController", :edit]
                   }

      it { is_expected.to eq route_data }
    end

    context "get 'album/:album_id/photos/:photo_id', to: 'photos#album_photo'" do
      subject do
        draw { get "/album/:album_id/photos/:photo_id", to: "photos#album_photo" }
      end

      regexp = %r{^/album/(?<album_id>[^/?#]+)/photos/(?<photo_id>[^/?#]+)$}
      route_data = { path: "/album/:album_id/photos/:photo_id",
                     pattern: [regexp, ["album_id", "photo_id"]],
                     klass_and_method: ["PhotosController", :album_photo]
                   }

      it { is_expected.to eq route_data }
    end
  end
end
