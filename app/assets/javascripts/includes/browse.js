$(function(){
  var $activeSlide = $('#slides .slide:first-child');

  $(".match-title").on("click", function(){
    var account_id = $(this).data("id");

    $.ajax({
      url: "/get/conversation/"+account_id,
      method: "post",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      dataType: "script"
    });
  });

  $("#decline").on("click", function(){
    var user_id = $activeSlide.data("id");

    $.ajax({
      url: "/decline/" + user_id,
      type: "post",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      dataType: "ajax"
    });

    goToSlide('decline')
  });

  $("#approve").on("click", function(){
    var user_id = $activeSlide.data("id");

    $.ajax({
      url: "/approve/" + user_id,
      type: "post",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      dataType: "ajax"
    });
    goToSlide('approve')
  });

  function goToSlide(action){
    $activeSlide.removeClass("showing");
    $activeSlide = $activeSlide.next(".slide");

    //send data to Controller
    if(action == "approve"){
        console.log(action)
    }else {
        console.log(action)
    }
    $activeSlide.addClass("showing");

      //slides[currentSlide].className = 'slide';
      //currentSlide = (n+slides.length)%slides.length;
      //slides[currentSlide].className = 'slide showing';
  }
});
