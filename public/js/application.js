$(document).ready(function(){
  $('.ipsum-container').hide();

  $('.paragraphs').customSelect();
  $('.word').on('keydown', function(e) {
    if(e.keyCode === 8) {
      inputWidth = (20 + this.value.length * 15);
      formWidth = (650 + this.value.length * 16);
    } else {
      inputWidth = (40 + this.value.length * 15);
      formWidth = (650 + this.value.length * 16);
    }

    if(inputWidth < 100) {
      inputWidth = 100;
      formWidth = 650;
    }

    $(this).css("width", inputWidth + "px");
    $('.form').css("width", formWidth + "px");
  });

  $('form').on("submit", function(e) {
    e.preventDefault();
    $.ajax({
      url: "/api/term/"+$('.word').val()+"/paragraphs/"+$('.paragraphs').val(),
      type: 'get',
      success: function(response) {
        var paragraphs = response.anyIpsum.split("\n");

        $('.ipsum-container').show().html("");

        $.each(paragraphs, function(index, value) {
          $('.ipsum-container').append('<p>'+paragraphs[index]+'</p>');
        });

        $('.word').val("");
      },
      error: function() {
        console.log("fail");
      }
    })
  })
})
