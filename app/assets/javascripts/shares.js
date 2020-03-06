$(document).ready(function () {
    $(document).on('keydown', '.suggest-user', function () {
        $('.suggest-user').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "/users/get_users",
                    method: "GET",
                    data: {q: request.term},
                    success: (data) => {
                        response($.map(data, function (item) {
                            return {label: item.id, value: item.email}
                        }));
                    }
                });
            },
            minLength: 2,
            select: function (event, ui) {
                $('.suggest-user').val(ui.item.value)
            }

        }).data("ui-autocomplete")._renderItem = function (ul, item) {
            return $("<li>" + item.value + "</li>")
                .appendTo(ul);
        }
    });

    $(document).on("change", ".share-privileges", function () {
        $.ajax({
            url: `/notes/${$(this).data('noteid')}/shares/${$(this).data('id')}`,
            method: 'PATCH',
            data: {value: $(this).val()}
        })
    })

});
