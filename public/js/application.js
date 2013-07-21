$(document).ready(function(){
  $('.ipsum-container').hide();

  $('.paragraphs').customSelect();
  $('.word').on('keydown', function(e) {
    if(e.keyCode === 8) {
      inputWidth = (20 + this.value.length * 12);
      formWidth = (620 + this.value.length * 13);
    } else {
      inputWidth = (40 + this.value.length * 12);
      formWidth = (620 + this.value.length * 13);
    }

    if(inputWidth < 100) {
      inputWidth = 100;
      formWidth = 640;
    }

    $(this).css("width", inputWidth + "px");
    $('.form').css("width", formWidth + "px");
  });

  $('form').on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      url: "/api/word/"+$('.word').val()+"/paragraphs/"+$('.paragraphs').val(),
      type: 'get',
      success: function(response) {
        $('.ipsum-container').show().html(response);
      },
      error: function() {
        alert("fail");
      }
    });
  });
});
