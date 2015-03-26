$(function(){
  $goButton = $('.navbar-form .btn')
  $searchField = $('.navbar-form input')

  $goButton.on('click', function(e){
    urlToParse = $searchField.val();

    $('.container.wall').html("\
      <button class='btn btn-default btn-lg center-block'>\
        <span class='spinner'><i class='glyphicon glyphicon-refresh spin'></i></span>\
      </button>\
    ");

    $.ajax({
      url: '/parse',
      type: 'GET',
      dataType: 'json',
      data: {
        url_to_parse: urlToParse
      },
      success: function (response) {
        $('.btn-lg').append('<a href="/download/'+response.file_path+'">Download</a>');
        $('.spinner').remove();
      },
      error: function () {
        $('.container.wall').prepend("\
          <div class='alert alert-warning'>Please provide url like:\
            <strong>http(s)://some_domain.com</strong>\
          </div>\
          ");
        $('.btn-lg').remove()
      }
    });

    e.preventDefault();
  });
});
