require 'spec_helper'

RSpec.describe Metric, type: :model do

  let!(:last_hour) { Metric.create(host_name: '1', network_name: '1', download_speed: 300)}
  let!(:two_hours_ago) { Metric.create(host_name: '1', network_name: '1', download_speed: 300, created_at: 2.hours.ago)}

  describe "scopes" do
    describe "#last_hour" do
      it "returns metrics within the las hour" do
        expect(Metric.last_hour).to eq([last_hour])
      end
    end
  end
end
