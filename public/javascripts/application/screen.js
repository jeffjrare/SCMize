$(document).ready(function(){
  bind_add_friend = function(item){
    var id = item.attr('id').replace('friend-', '');

    item.find('a.add').click(function(){
      $.post($(this).attr('href'), {'friend[id]': id}, function(data){
        if(data.result){
          console.log(data.data);
        }
      });

      return false;
    });
  };

  bind_edit_item = function(item){
    item.find('a.edit').click(function(){
      $.get($(this).attr('href'), function(data){
        if(data.result){
          var popup = $('#pop-text');
          popup.find('form.form-add-text').hide();
          popup.append(data.html);
          popup.modal('show');

          popup.bind('hidden', function(){
            $(this).find('form.form-edit-text').remove();
            popup.find('form.form-add-text').show();
          });
        }
      });

      return false;
    });
  };

  bind_delete_item = function(item){
    item.find('a.delete').click(function(){
      if(confirm('Voulez-vous vraiment supprimer cet article?')){
        $.post($(this).attr('href'), item.attr('id').replace('item-state-', ''), function(data){
          var count_span = $('.listing-texts .count span'),
              count = parseInt(count_span.html());
          
          if(data.result){
            item.remove();

            count_span.html(count-1);
            count_span.effect("highlight", {}, 2000);
          }
        });
      }

      return false;
    });
  };

  attach_events = function(){
    $('a#btn-text-save').click(function(){
      $.post($(this).attr('href'), {'text[content]': $('#text-content').val()}, function(data){
        
        if(data.result){
        }
      });

      return false;
    });

    $('#text-content').wysiwyg();

    $('ul.texts li').each(function(){
      //bind_edit_item($(this));
      bind_delete_item($(this));
    });

    $('ul.texts li').click(function(){
      window.location = $(this).find('a.edit:first').attr('href');
    });

    $('table.friends tbody tr').each(function(){
      bind_add_friend($(this));
    });

    $('.text-state').click(function(){
      var state = $(this);
      if(state.hasClass('offline')){
        state.removeClass('offline').addClass('online success').html('Publié');
      }else{
        state.removeClass('online success').addClass('offline').html('Hors-ligne');
      }
    });

    $('#frm-text').submit(function(){
      var form = $('#frm-text');

      $.post(form.attr('action'), form.serialize(), function(result){
        var item,
            count = parseInt($('.listing-texts .count span').html());

        $('ul.texts').append(result.html);
        $('.listing-texts .count span').html(count+1).effect("highlight", {}, 2000);

        item = $('#text-state-' + result.data._id);

        item.find('.text-state').click(function(){
          var state = $(this);
          if(state.hasClass('offline')){
            state.removeClass('offline').addClass('online').html('Publié');
          }else{
            state.removeClass('online').addClass('offline').html('Hors-ligne');
          }
        });

        //bind_edit_item(item);
        bind_delete_item(item);
      });

      $('#pop-text').modal('hide');

      return false;
    });

    $('#frm-text a.btn.secondary').click(function(){
      $('#pop-text').modal('hide');
    });

    $('#edit-nav li, #community-nav li, #user-nav li').click(function(){
      var li = $(this);
      li.parent().find('li').removeClass('active');
      li.addClass('active');

      if(li.hasClass('listing')){
        $('.tab:last').hide();
        $('.tab:first').show();
      }else{
        $('.tab:first').hide();
        $('.tab:last').show();
      }

    });
  };

  $('#pop-text').modal({backdrop: true});

  attach_events();
});
