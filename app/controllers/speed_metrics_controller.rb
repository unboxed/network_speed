class SpeedMetricsController < ApplicationController

  def index
    network_names = Metric.select("network_name").group("network_name").map(&:network_name)

    @metrics = network_names.map do |network_name|
      { name: network_name, data: data(network_name) }
    end

    response.headers["X-FRAME-OPTIONS"] = "goforit"
  end

  def data(network_name)
    Metric.where(network_name: network_name).last_hour.group_by {|m| m.created_at.strftime("%H:%M") }.sort.inject({}) {|a, (k, v)| a[k] = v.map(&:download_speed).reduce(:+).to_f / v.size; a }
  end

  def create
    if Metric.create(metric_params)
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def metric_params
    params.permit(:host_name, :network_name, :download_speed)
  end
end
