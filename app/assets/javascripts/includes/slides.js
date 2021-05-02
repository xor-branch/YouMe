$(function(){
  var $activeSlide = $('#slides .slide:first-child');


  //$activeSlide.addClass("showing");

  $("#decline").on("click", function(){
    goToSlide('decline')
  })

  $("#approve").on("click", function(){
    goToSlide('approve')
  })

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
