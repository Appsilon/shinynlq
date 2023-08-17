var textDropdownInput = new Shiny.InputBinding();

$.extend(textDropdownInput, {
  find: function(scope) {
    return $(scope).find(".nlq-dropdown-button");
  },

  initialize: function() {
    $(".dropdown-menu li a").click(function(){
      $this = $(this);
      selected_value = $this.data("state");
      text_dropdown_button = $this.parents(".nlq-dropdown").find(".nlq-dropdown-button");
      text_dropdown_button.html(selected_value);
      text_dropdown_button.data("state", selected_value);

      dropdown_menu = $this.parents(".nlq-dropdown").find(".dropdown-menu li a")
      dropdown_menu.removeClass("item_selected");
      $this.addClass("item_selected");
    });
  },

  getValue: function(el) {
    return $(el).data("state");
  },

  subscribe: function (el, callback) {
    dropdown_menu = $(el).parents(".nlq-dropdown").find(".dropdown-menu li a");
    dropdown_menu.click(function() {
      callback();
    });
  },

  unsubscribe: function(el) {
    $(el).off(".nlq-dropdown-button");
  }
});

Shiny.inputBindings.register(textDropdownInput);
