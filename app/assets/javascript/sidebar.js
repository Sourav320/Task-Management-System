$(document).ready(function () {
  $("#sidebarToggle").on("click", function () {
    $("#sidebar").toggleClass("collapsed");
    $(".main-wrap").toggleClass("collapsed");
  });
});

$(document).ready(function () {
  setTimeout(function () {
    $('.alert').each(function () {
      let alert = new bootstrap.Alert(this);
      alert.close();
    });
  }, 3000);
});

