var scriptnname = GetParentResourceName();

window.addEventListener("message", function(event) {
    let factioninvitedata = event.data;
    switch (factioninvitedata.type) {
        case "showinvite":
            $("body").show();
            $("span").html(factioninvitedata.factionname);
            break;
        case "hideinvite":
            $("body").hide();
            break;
    }

    $(".accept").click(function() {
        $.post(`https://${scriptnname}/accept`);
    });

    $(".decline").click(function() {
        $.post(`https://${scriptnname}/decline`);
    });
});