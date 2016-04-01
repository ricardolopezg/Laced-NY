$(document).ready(function() {

  // check is div hasClass()
  // if ($(".products_container_all").hasClass("products_container_all_display") && $(".products_container_all").hasClass(".products_container_all_display") && $(".products_container").children().hasClass(".products_container_all_display") && $(".products_container").children().hasClass(".giuseppe_zanotti_display") && $(".products_container").children().hasClass(".louis_vuitton_display") && $(".products_container").children().hasClass(".maison_margiella_display") && $(".products_container").children().hasClass(".yeezy_display")) {
  //   location.reload();
  // }

  $(':checkbox[id="all_brands_checkbox"]').on("change", function() {
    $(".products_container_all_toggle").removeClass("products_container_all_display");
    $(':checkbox[id="yeezy_checkbox"], :checkbox[id="maison_margiella_checkbox"], :checkbox[id="louis_vuitton_checkbox"], :checkbox[id="giuseppe_zanotti_checkbox"]').prop('checked', false);
    $(':checkbox[id="all_brands_checkbox"]').prop('checked', true); // disables unchecking all brands checkbox
    $(".giuseppe_zanotti_toggle").addClass("giuseppe_zanotti_display");
    $(".louis_vuitton_toggle").addClass("louis_vuitton_display");
    $(".maison_margiella_toggle").addClass("maison_margiella_display");
    $(".yeezy_toggle").addClass("yeezy_display");
  })

  $(':checkbox[id="giuseppe_zanotti_checkbox"]').on("change", function() {
    $(':checkbox[id="all_brands_checkbox"]').removeAttr('checked');
    // $(this).setAttribute('checked', 'checked');
    $(".products_container_all_toggle").addClass("products_container_all_display");
    $(".giuseppe_zanotti_toggle").toggleClass("giuseppe_zanotti_display");
  })

  $(':checkbox[id="louis_vuitton_checkbox"]').on("change", function() {
      $(':checkbox[id="all_brands_checkbox"]').removeAttr('checked');
      $(".products_container_all_toggle").addClass("products_container_all_display");
      $(".louis_vuitton_toggle").toggleClass("louis_vuitton_display");
  })

  $(':checkbox[id="maison_margiella_checkbox"]').on("change", function() {
    $(':checkbox[id="all_brands_checkbox"]').removeAttr('checked');
    $(".products_container_all_toggle").addClass("products_container_all_display");
    $(".maison_margiella_toggle").toggleClass("maison_margiella_display");
  })

  $(':checkbox[id="yeezy_checkbox"]').on("change", function() {
    $(':checkbox[id="all_brands_checkbox"]').removeAttr('checked');
    $(".products_container_all_toggle").addClass("products_container_all_display");
    $(".yeezy_toggle").toggleClass("yeezy_display");
    })




// LANDING PAGE
    $("#intro").fadeOut(20)
  // $("#intro").delay(4000).fadeOut(2000)



// MASONRY
// external js: isotope.pkgd.js

  // init Isotope
  var $container = $('.isotope').isotope({
    itemSelector: '.element-item',
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


  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });

}); // end doc ready
