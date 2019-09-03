$(document).on('turbolinks:load', function () {
    $(document).ready(function () {
        $(document).on("click", ".form-input-icon", function () {
            $(".navbar-search").submit();
        });
    });

    $(document).on("click", ".note-pin", function () {
        $.ajax({
            type: "POST",
            url: `/notes/${$(this).parents('.card').attr("data-id")}/pinned`,
            data: `id=${$(this).parents('.card').attr("data-id")}&pinned=${$(this).attr("data-pinned")}`,
            success: function (result) {
                if (!result)
                    return;

                $(`.card[data-id="${result.id}"] .note-pin`).attr("data-pinned", result.is_pinned);

                if (result.is_pinned) {
                    $(`.card[data-id="${result.id}"] .note-pin`).removeClass("fas fa-map-pin").addClass("fas fa-thumbtack");
                } else {
                    $(`.card[data-id="${result.id}"] .note-pin`).removeClass("fas fa-thumbtack").addClass("fas fa-map-pin");
                }
            }
        });
    });
});