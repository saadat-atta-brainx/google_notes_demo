// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
$(document).ready(function () {
    $(document).on("click", ".form-input-icon", function () {
        $(".navbar-search").submit();
    });

    $(document).on("click", ".note-pin", function () {
        $.ajax({
            type: "POST",
            url: `/notes/${$(this).attr("data-id")}/pinned`,
            data: `id=${$(this).attr("data-id")}&pinned=${$(this).attr("data-pinned")}`,
            success: function (result) {
                if (!result)
                    return;

                $(`.note-pin[data-id="${result.id}"]`).attr("data-pinned", result.is_pinned);

                if (result.is_pinned) {
                    $(`.note-pin[data-id="${result.id}"]`).removeClass("fas fa-map-pin").addClass("fas fa-thumbtack");
                } else {
                    $(`.note-pin[data-id="${result.id}"]`).removeClass("fas fa-thumbtack").addClass("fas fa-map-pin");
                }
            }
        });
    });

});
