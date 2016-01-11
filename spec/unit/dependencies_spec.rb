require "spec_helper"
$LOAD_PATH.unshift File.expand_path("../helpers", __FILE__)

describe "Helpers Methods" do
  context "#const_missing" do
    it { expect("Person".constantize).to eq Person }

    it { expect("Todo".constantize).to eq Todo }

    it { expect("PersonController".constantize).to eq PersonController }
  end
end
