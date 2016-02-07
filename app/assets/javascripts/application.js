//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function () {
    init_tr_links();
});

function init_tr_links() {
    $("table.clickable-rows td").on("click", function (e) {
        e.preventDefault();
        location.href = $(this).parent().data('url');
    });
}
