$ ->
    # 5行以上ある場合は追加ボタンを隠す
     $('#remove-plan-detail').on 'cocoon:before-remove', ->
          if $('#remove-plan-detail .nested-fields').length == 1
             $('#remove-link').hide();
          else
             $('#remove-link').hide();
            
            