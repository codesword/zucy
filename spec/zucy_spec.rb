require "spec_helper"

describe Zucy do
  it "has a version number" do
    expect(Zucy::VERSION).not_to be nil
  end
end

TodoApplication = Todolist::Application.new


describe "Todolist App" do
  include Rack::Test::Methods

  TodoApplication = Todolist::Application.new
  def app
    require "todolist/config/routes.rb"
    TodoApplication
  end

  it "returns a list of all my todos" do
    get "/todos"
    expect(last_response).to be_ok
    expect(last_response.body).to eq(
      "['Write a book', 'Build a house', 'Get married', 'Buy a car']")
  end

  it "returns first item in my todolist" do
    get "/todo/5"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Write a book")
  end

  it "can respond to post request" do
    post "/todo/10"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Post go swimming")
  end

  it "can respond to put request" do
    put "/todo/20"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Put Write a book")
  end

  it "can respond to delete request" do
    delete "/todo/2"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("Delete Write a book")
  end
end
