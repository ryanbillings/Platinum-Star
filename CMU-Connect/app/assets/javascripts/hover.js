/*
 * Smart event highlighting
 * Handles when events span rows, or don't have a background color
 */
jQuery(document).ready(function($) {
  var highlight_color = "#68eec6";
  // 755cda
  // 9b8cda  
  // highlight on mouse over
  $(".day_list").live("mouseover", function() {  $(this).css("background", highlight_color);
    $(this).css("background", "-moz-linear-gradient(top,  #9b8cda 0%, #755cda 100%)");
    $(this).css("background", "-webkit-gradient(linear, left top, left bottom, color-stop(0%,#9b8cda), color-stop(100%,#755cda))");
    $(this).css("background", "-webkit-linear-gradient(top,  #9b8cda 0%,#755cda 100%)");
    $(this).css("background", "-o-linear-gradient(top,  #9b8cda 0%,#755cda 100%)");
    $(this).css("background", "-ms-linear-gradient(top,  #9b8cda 0%,#755cda 100%)");
    $(this).css("background", "linear-gradient(top,  #9b8cda 0%,#755cda 100%)");

  });

  // Mouse out
  $(".day_list").live("mouseout", function() {
    $(this).css("background", highlight_color);
    $(this).css("background", "-moz-linear-gradient(top,  #68eec6 0%, #33d7af 100%)");
    $(this).css("background", "-webkit-gradient(linear, left top, left bottom, color-stop(0%,#68eec6), color-stop(100%,#33d7af))");
    $(this).css("background", "-webkit-linear-gradient(top,  #68eec6 0%,#33d7af 100%)");
    $(this).css("background", "-o-linear-gradient(top,  #68eec6 0%,#33d7af 100%)");
    $(this).css("background", "-ms-linear-gradient(top,  #68eec6 0%,#33d7af 100%)");
    $(this).css("background", "linear-gradient(top,  #68eec6 0%,#33d7af 100%)");
  }); 
 });
