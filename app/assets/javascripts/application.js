// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require chartkick
//= require_tree .

$(document).ready(function(){
  speed = {}

  speed.update_chart = function(){
    chart = Chartkick.charts["chart-1"]

    $.ajax({
      url: "/speed_metrics.json"
    }).done(function(data) {
      chart.updateData(data)
    });
  }

  setInterval(speed.update_chart, 60000);
});
