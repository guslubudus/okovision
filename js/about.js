/*****************************************************
 * Projet : Okovision - Supervision chaudiere OeKofen
 * Auteur : Stawen Dronek
 * Utilisation commerciale interdite sans mon accord
 ******************************************************/
/* global lang */
$(document).ready(function() {

    function checkUpdate() {
        //$.getJSON("ajax.php?type=admin&action=checkUpdate" , function(json) {
        $.api('GET', 'admin.checkUpdate').done(function(json) {

            $("#inwork-checkupdate").hide();

            if (json.newVersion) {
                $.each(json.list, function(key, val) {
                    //console.log(val);
                    $('#informations').append(
                        '<div class="panel panel-default"> \
    				        <div class="panel-heading">' + val.version + '</div> \
    				        <div class="panel-body"> \
    				            ' + val.changelog + ' \
    				        </div> \
    				    </div>'
                    );
                    $("#bt_update").show();
                });

            }
            else {
                $("#bt_update").hide();
                $('#informations').append(json.information);
            }
        });
    }

    $("#bt_update").click(function() {
        //console.log('ici');
        $('#informations').html("");
        $("#inwork-makeupdate").show();

        //$.getJSON("ajax.php?type=admin&action=makeUpdate" , function(json) {
        $.api('GET', 'admin.makeUpdate').done(function(json) {

            $("#inwork-makeupdate").hide();

            if (json.install) {
                $.growlValidate(lang.valid.maj);

            }
            else {
                $('#informations').append(json.information);
                $.growlErreur(lang.error.maj);
            }
            checkUpdate();
        });
    });

    checkUpdate();

});