# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	Morris.Donut
	  element: 'repartition'
	  data: [ {label: "Disponible", value: 1}, {label: "En mission", value: 2}, {label: "Ne sait pas", value: 0}, {label: "Congés", value: 0}, {label: "Formation", value: 1}, ]