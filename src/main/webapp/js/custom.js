"use strict";
jQuery(document).ready(function($) {
	
	//hidden products menu
    //show
	$(".hidden-menu-trigger").on("click", function (event) {
        event.preventDefault();
        $("#page-main-content").addClass("move-out");
        $("#main-nav").addClass("is-visible");
    });
    //hide
    $(".hidden-menu-close").on("click", function (event) {
        event.preventDefault();
        $("#page-main-content").removeClass("move-out");
        $("#main-nav").removeClass("is-visible");
    });

    //Owl carousel
    $(".carousel-default").owlCarousel({
        navigation: false,
        slideSpeed: 300,
        paginationSpeed: 400,
        autoPlay: true,
        addClassActive: true,
        navigationText: ["&#xf104", "&#xf105"],
        singleItem: true
    });
    $(".carousel-fade-transition").owlCarousel({
        navigation: false,
        slideSpeed: 300,
        paginationSpeed: 400,
        autoPlay: true,
        addClassActive: true,
        navigationText: ["&#xf104", "&#xf105"],
        singleItem: true,
        transitionStyle: "fade"
    });
    $(".carousel-blocks").owlCarousel({
        slideSpeed: 300,
        autoPlay: 5000,
        navigation: false,
        navigationText: ["&#xf104", "&#xf105"],
        pagination: true,
        addClassActive: true,
        items: 4,
        itemsDesktop: [768,3],
        itemsDesktopSmall: [480,1]
  });

    //product quantity
    $(".numbers-row").append('<div class="inc quantity-btn">+</div><div class="dec quantity-btn">-</div>');

    $(".quantity-btn").on("click", function () {

        var $button = $(this), oldValue = $button.parent().find("input").val();

        if ($button.text() === "+") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
    // Do not allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
            newVal = 0;
            }
	    }

        $button.parent().find("input").val(newVal);

    });
	
	//Tabs
    $('.tabs').each(function(intex, element) {
      $(this).prepend('<div class="tab-nav line"></div>');
      var tab_buttons = $(element).find('.tab-label');
      $(this).children('.tab-nav').prepend(tab_buttons);
      $(this).children('.tab-item').each(function(i) {
          $(this).attr("id", "tab-" + (i + 1));
      });
      $(".tab-nav").each(function() {
          $(this).children().each(function(i) {
              $(this).attr("href", "#tab-" + (i + 1));
          });
      });
      $(this).find(".tab-nav a").click(function(event) {
          $(this).parent().children().removeClass("active-btn");
          $(this).addClass("active-btn");
          var tab = $(this).attr("href");
          $(this).parent().parent().find(".tab-item").not(tab).css("display", "none");
          $(this).parent().parent().find(tab).fadeIn();
          return false;
      });
    });
  
    //Navigation   
    $('.top-nav > ul > li ul').each(function(index, element) {
      var count = $(element).find('li').length;
      var content = '<span class="count-number"> ' + count + '</span>';
      $(element).closest('li').children('a').append(content);
    });
    $('.top-nav > ul li:has(ul)').addClass('submenu');
    $('.top-nav > ul ul li:has(ul)').addClass('sub-submenu').removeClass('submenu');
    $('.top-nav > ul li.submenu > a').attr('aria-haspopup', 'true').click(function() {
      //Close other open sub menus
      $('.top-nav > ul li.submenu:hover > ul').toggleClass('show-ul', 'slow');
    }); 
    $('.top-nav > ul ul > li.sub-submenu > a').attr('aria-haspopup', 'true').click(function() {  
      //Close other open sub menus
      $('.top-nav ul ul li > ul').removeClass('show-ul', 'slow');  
      $('.top-nav ul ul li:hover > ul').toggleClass('show-ul', 'slow');   
    });
    //Mobile aside navigation  
      $('.nav-text').click(function() {
      $('.top-nav > ul').toggleClass('show-menu', 'slow');
    });

});


	
// Content Animation start
var scrollCb = function () {
	var tiles = $(".animated");
	var $window = $(window);
	var b = $window.scrollTop() + $window.height();

	tiles.each(function (i) {
		var $this = $(this);
		var a = $this.offset().top + $this.height();

		if (a < b) {
			$this.addClass("animated").addClass("animation");
		}
	});
};
$(scrollCb);
$(window).scroll(scrollCb);
// Content Animation end