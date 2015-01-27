    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#content-wrapper").toggleClass("toggled");
        $("#sidebar-wrapper").toggleClass("toggled");
        $(".sidebar-nav").toggleClass("toggled");
        $("#wrapper").toggleClass("toggled");
    });
