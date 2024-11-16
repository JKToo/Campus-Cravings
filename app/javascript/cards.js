
  $('#bologna-list a').on('click', function (e) {
    e.preventDefault()
    $(this).tab('show')
  })


  function changeDivContent(div) {
    console.log(div)
  }

  $(".nav-tabs").on('click',function(){
    $("#tab-pane li.active").removeClass('active');
    $(this).addClass('active');
 });