// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require fullcalendar
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function() {
	$('.bedTable tbody tr:odd').addClass('odds');
});

$(document).ready(function(){
	$('.dateField').datepicker();
});


$(document).ready(function(){
	$('#hideBeds').click(function(){
		$('#hideBeds').next().hide();
	});
});


// $(document).ready(function() {
// 	var start = $('.bedTable tbody tr td:first').text();
// 	if (start == "A1") {
// 		alert("hit")
// 	}
// });



