$(document).ready(function(){
    $("#intro").fadeOut(20)
  // $("#intro").delay(4000).fadeOut(2000)

  var $grid = $('.grid').masonry({
    itemSelector: '.grid-item',
  });

  $grid.on( 'click', '.grid-item', function() {
    // change size of item via class
    $( this ).toggleClass('grid-item--gigante');
    // trigger layout
    $grid.masonry();
    $(this).children("span").toggleClass("desc");
  });

}); // end doc ready