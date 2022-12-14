// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "jquery";

$(function () {
  var count_group = $(".list-left .group").length;
  var deg_bg = 0;
  var active = 0;
  var list_color = ["#40BCBB", "#B58CD4", "#E5CA63"];
  $(".bg-rotate").css("transition", "4s");
  $("#group_item_0").addClass("active");

  function changeActive() {
    $(
      "#group_item_" +
        (active - 2 == -1
          ? count_group - 1
          : active - 2 == -2
          ? count_group - 2
          : active - 2)
    ).removeClass("active");
    $("#group_item_" + active).addClass("active");

    deg_bg = deg_bg + 190;
    active = active >= count_group - 1 ? 0 : active + 1;
    $(".bg-rotate").css("transform", "rotate(" + deg_bg + "deg)");
    $(".bg-rotate").css("background-color", list_color[active]);
  }
  changeActive();
  setInterval(changeActive, 5000);
});
