require 'spec_helper'

RSpec.describe Metric, type: :model do

  let!(:last_hour) { Metric.create(host_name: '1', network_name: '1', download_speed: 300)}
  let!(:two_hours_ago) { Metric.create(host_name: '1', network_name: '1', download_speed: 300, created_at: 2.hours.ago)}
  let!(:twenty_five_hours_ago) { Metric.create(host_name: '1', network_name: '1', download_speed: 300, created_at: 25.hours.ago)}

  describe "scopes" do
    describe "#last_hour" do
      it "returns metrics within the last hour" do
        expect(Metric.last_hour).to eq([last_hour])
      end
    end
  end

  describe "scopes" do
    describe "#last_24_hours" do
      it "returns metrics within the last 24 hours" do
        expect(Metric.last_24_hours).to eq([two_hours_ago, last_hour])
      end
    end
  end
end
