require 'spec_helper'

describe Video do 
  it "save itself" do
    video = Video.new(title: "monk", description: "a great video")
    video.save
    expect(Video.first).to eq(video)
  end
end