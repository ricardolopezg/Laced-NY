$(document).ready(function() {
// LANDING PAGE
    $("#intro").fadeOut(20)

// $("#intro").delay(4000).fadeOut(2000)

// $("#image").click(function() {
//     $(this).find('img').toggle();
// });​


// $("#infoToggler").click(function() {
//     $(this).find('img').toggle();
// });​

// <div id="infoToggler"><img src="http://tympanus.net/PausePlay/images/play.png" width="60px" height="60px"/>
// <img src="http://maraa.in/wp-content/uploads/2011/09/pause-in-times-of-conflict.png" width="60px" height="60px" style="display:none"/>
// </div>




// ISOTOPE
  var $container = $('.isotope').isotope({
    itemSelector: '.product-item',
    layoutMode: 'fitRows',
    getSortData: {
      name: '.name',
      symbol: '.symbol',
      number: '.number parseInt',
      category: '[data-category]',
      weight: function( itemElem ) {
        var weight = $( itemElem ).find('.weight').text();
        return parseFloat( weight.replace( /[\(\)]/g, '') );
      }
    }
  });
  // filter functions
  var filterFns = {
    // show if number is greater than 50
    numberGreaterThan50: function() {
      var number = $(this).find('.number').text();
      return parseInt( number, 10 ) > 50;
    },
    // show if name ends with -ium
    ium: function() {
      var name = $(this).find('.name').text();
      return name.match( /ium$/ );
    }
  };
  // bind filter button click
  $('#filters').on( 'click', 'button', function() {
    var filterValue = $( this ).attr('data-filter');
    // use filterFn if matches value
    filterValue = filterFns[ filterValue ] || filterValue;
    $container.isotope({ filter: filterValue });
  });
  // bind sort button click
  $('#sorts').on( 'click', 'button', function() {
    var sortByValue = $(this).attr('data-sort-by');
    $container.isotope({ sortBy: sortByValue });
  });

  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });


$('a').hover(function() {
     // in
     $(this).find('.text-content').show();
  }, function() {
     // out
     $(this).find('.text-content').hide();
  }
);

}); // end doc ready




