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
