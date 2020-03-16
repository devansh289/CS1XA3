$(function() {
  var isMobile;
  if (
    /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
      navigator.userAgent
    )
  ) {
    isMobile = true;

    // Mobile height fix
    $(".height-fix").each(function() {
      var h = $(this).height();
      $(this).height(h);
    });
  }

  // RESIZE RESETS
  $(window).resize(function() {
    posFilterBar($(".filter").first());
  });

  // Sticky Nav on Mobile
  if (isMobile) {
    $("nav").addClass("fixed");
  } else {
    $("nav").addClass("desk");
  }

  // NAV POSITION
  var navPos = $("nav").position().top;
  var lastPos = 0;
  var lockTimer;

  $(window).on("scroll", function() {
    var pos = $(window).scrollTop();
    var pos2 = pos + 50;
    var scrollBottom = pos + $(window).height();

    if (!isMobile) {
      if (pos >= navPos + $("nav").height() && lastPos < pos) {
        $("nav").addClass("fixed");
      }
      if (pos < navPos && lastPos > pos) {
        $("nav").removeClass("fixed");
      }
      lastPos = pos;
    }

    // Link Highlighting
    if (pos2 > $("#home").offset().top) {
      highlightLink("home");
    }
    if (pos2 > $("#about").offset().top) {
      highlightLink("about");
    }
    if (pos2 > $("#portfolio").offset().top) {
      highlightLink("portfolio");
    }
    /*if (pos2 > $('#blog').offset().top)       { highlightLink('blog'); }*/
    if (
      pos2 > $("#contact").offset().top ||
      pos + $(window).height() === $(document).height()
    ) {
      highlightLink("contact");
    }

    // Prevent Hover on Scroll
    clearTimeout(lockTimer);
    if (!$("body").hasClass("disable-hover")) {
      $("body").addClass("disable-hover");
    }

    lockTimer = setTimeout(function() {
      $("body").removeClass("disable-hover");
    }, 500);
  });

  function highlightLink(anchor) {
    $("nav .active").removeClass("active");
    $("nav")
      .find('[dest="' + anchor + '"]')
      .addClass("active");
  }

  // EVENT HANDLERS
  $(".page-link").click(function() {
    var anchor = $(this).attr("dest");
    $(".link-wrap").removeClass("visible");

    $("nav span").removeClass("active");
    $("nav")
      .find('[dest="' + anchor + '"]')
      .addClass("active");

    $("html, body").animate(
      {
        scrollTop: $("#" + anchor).offset().top
      },
      400
    );
  });

  $(".mdi-menu").click(function() {
    $(".link-wrap").toggleClass("visible");
  });

  posFilterBar($(".filter").first());

  $(".filter").click(function() {
    posFilterBar(this);
  });

  function posFilterBar(elem) {
    var origin = $(elem)
      .parent()
      .offset().left;
    var pos = $(elem).offset().left;
    $(".float-bar").css({
      left: pos - origin,
      width: $(elem).innerWidth()
    });
    $(".float-bar .row").css("left", (pos - origin) * -1);
  }

  // GALLERY
  $("#gallery").mixItUp({});

  function mixClear() {
    setTimeout(function() {
      $("#gallery").removeClass("waypoint");
    }, 2000);
  }

  // SCROLL ANIMATIONS
  function onScrollInit(items, elemTrigger) {
    var offset = $(window).height() / 1.6;
    items.each(function() {
      var elem = $(this),
        animationClass = elem.attr("data-animation"),
        animationDelay = elem.attr("data-delay");

      elem.css({
        "-webkit-animation-delay": animationDelay,
        "-moz-animation-delay": animationDelay,
        "animation-delay": animationDelay
      });

      var trigger = elemTrigger ? trigger : elem;

      trigger.waypoint(
        function() {
          elem.addClass("animated").addClass(animationClass);
          if (elem.get(0).id === "gallery") mixClear(); //OPTIONAL
        },
        {
          triggerOnce: true,
          offset: offset
        }
      );
    });
  }

  setTimeout(function() {
    onScrollInit($(".waypoint"));
  }, 10);
});

var request = $.ajax({
  url: "https://api.openweathermap.org/data/2.5/weather",
  method: "GET",
  data: {
    id: "6075357",
    appid: "b392ffd1c01773a38d1fe476bf6b32b4",
    units: "metric"
  },
  success: function(response) {
    var temp = response.main.temp;
    var titleColor = null;

    if (temp > 20) {
      titleColor = "rgb(255, 242, 0)";
    } else if (temp < 0) {
      titleColor = "rgb(0, 170, 255)";
    } else {
      titleColor = "rgb(147, 190, 219)";
    }

    $(".highlight").css("color", titleColor);
  }
});

$("#submit").click(function() {
  // get the form elements defined in your form HTML above

  var form = $("my-form");
  // Success and Error functions for after the form is submitted

  function success() {
    form.reset();
    $(".success").css("height", "10px");
  }

  // handle the form submission event

  form.addEventListener("submit", function(ev) {
    ev.preventDefault();
    var data = new FormData(form);
    ajax(form.method, form.action, data, success, error);
  });
});

function ajax(method, url, data, success, error) {
  var xhr = new XMLHttpRequest();
  xhr.open(method, url);
  xhr.setRequestHeader("Accept", "application/json");
  xhr.onreadystatechange = function() {
    if (xhr.readyState !== XMLHttpRequest.DONE) return;
    if (xhr.status === 200) {
      success(xhr.response, xhr.responseType);
    } else {
      error(xhr.status, xhr.response, xhr.responseType);
    }
  };
  xhr.send(data);
}

