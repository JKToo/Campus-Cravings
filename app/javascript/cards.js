

  function changeDivContent(div) {
    console.log(div)
  }

  $(".nav-tabs").on('click',function(){
    $("#tab-pane li.active").removeClass('active');
    $(this).addClass('active');
 });


 $( document ).ready(function() {
  $(document).on("click", "#close-show", function(){
    $("#show").hide();
  });
});