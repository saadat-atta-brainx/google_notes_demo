$(document).on('turbolinks:load', function () {
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