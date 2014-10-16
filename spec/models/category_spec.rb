require 'rails_helper'

describe Category do
  it { should have_many(:videos)}

  describe "#recent_videos" do
    it "returns the videos in the reverse chronical order by created_at" do
      comedies = Category.create(name: comedies)
      futurama = Video.create(title: "Futurama", description: "space travel", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "FUnny kids", category: comedies)
      expect(comedies.recent_videos).to eq([south_park,futurama])
    end
    it "returns all the videos if there are less than 6 videos" do
      comedies = Category.create(name: comedies)
      futurama = Video.create(title: "Futurama", description: "space travel", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "FUnny kids", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)
    end      
    it "returns 6 videos if there are more than 6 videos" do
      comedies = Category.create(name: comedies)
      i = 0
      k = 0
      7.times { Video.create(title: "foo"+ "#{i+=1}", description: "#{k+=1}",category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end
    it "returns most recent 6 vidoes " do
      comedies = Category.create(name: comedies)
      6.times { Video.create(title: "foo", description: "bar",category: comedies)}
      tonighta_show = Video.create(title: "tonights show", description: "beautiful", category: comedies, created_at: 1.day.ago)
      expect(comedies.recent_videos).not_to include(tonighta_show)
    end

    it "returns empty array if no videos in category" do
       comedies = Category.create(name: comedies)
       expect(comedies.recent_videos).to eq([])
    end

  end
end
