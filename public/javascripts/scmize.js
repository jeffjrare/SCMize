$(document).ready(function(){
  // fix sub nav on scroll
  var $win = $(window)
    , $nav = $('.subnav')
    , navTop = $('.subnav').length && $('.subnav').offset().top - 40
    , isFixed = 0

  processScroll()

  $win.on('scroll', processScroll)

  function processScroll() {
    var i, scrollTop = $win.scrollTop()
    if (scrollTop >= navTop && !isFixed) {
      isFixed = 1
      $nav.addClass('subnav-fixed')
    } else if (scrollTop <= navTop && isFixed) {
      isFixed = 0
      $nav.removeClass('subnav-fixed')
    }
  };

  $('.delete-action').click(function(){
    if(confirm('Are you sure you want to delete this item?')){
      var item = $(this);

      item.append('<form method="post" action="' + item.attr('href') + '"><input type="hidden" name="_method" value="delete" /></form>');
      item.find('form:first').submit();
    }

    return false;
  });

  $('.post-action').click(function(){
    var item = $(this);

    item.append('<form method="post" action="' + item.attr('href') + '"></form>');
    item.find('form:first').submit();

    return false;
  });
});