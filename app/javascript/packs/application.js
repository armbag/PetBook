import "bootstrap";

import initMap from '../plugins/init_mapbox.js'


initMap()

$('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var email = button.data('email')
  var name = button.data('name')
  var pet = button.data('pet') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('Tell ' + name + ' you could pet-sit ' + pet)
  modal.find('.modal-body input').val(email)
})

$('#exampleModalSent').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var name = button.data('name') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('Message to ' + name + ' sent!')
})
