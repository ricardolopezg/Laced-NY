$(document).ready(function(){


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
