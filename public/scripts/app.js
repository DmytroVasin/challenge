$(function(){
  console.log('!!!!');

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
      dataType: 'script',
      data: {
        url_to_parse: urlToParse
      }
    });

    e.preventDefault();
  });
});
