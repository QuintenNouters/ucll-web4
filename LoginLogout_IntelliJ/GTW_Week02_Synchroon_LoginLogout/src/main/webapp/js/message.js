$(document).ready(function(){
    setInterval(updateMessages,5000);
    var arr = []; // List of users
    //Het naar onder en boven sliden van de chatbox
    $(document).on('click', '.msg_head', function() {
        var chatbox = $(this).parents().attr("rel") ;
        $('[rel="'+chatbox+'"] .msg_wrap').slideToggle('slow');
        return false;
    });

    //het sluiten van de chatbox
    $(document).on('click', '.close', function() {
        var chatbox = $(this).parents().parents().attr("rel") ;
        $('[rel="'+chatbox+'"]').hide();
        arr.splice($.inArray(chatbox, arr), 1);
        displayChatBox();
        return false;
    });

    //het openen van de chatbox
    $(document).on('click', '.friend', function() {

        var userID = $(this).attr("id");
        var username = $(this).find("p.friendName").text() ;

        if ($.inArray(userID, arr) != -1)
        {
            arr.splice($.inArray(userID, arr), 1);
        }

        arr.unshift(userID);
        chatPopup =  '<div class="msg_box" style="right:270px" rel="'+ userID+'">'+
            '<div class="msg_head">'+username +
            '<div class="close">x</div> </div>'+
            '<div class="msg_wrap"> <div class="msg_body"> <div class="msg_push"></div> </div>'+
            '<div class="msg_footer"><textarea class="msg_input" rows="4"></textarea></div>  </div>  </div>' ;

        $("body").append(chatPopup);
        displayChatBox();
    });

    //Wanneer er enter wordt geklikt in de textarea
    $(document).on('keypress', 'textarea' , function(e) {
        if (e.keyCode == 13 ) {
            var id = $(".friend").attr("id");
            var msg = $(this).val();
            $(this).val('');
            if(msg.trim().length != 0){
                var url = "Controller?action=Message&message="+encodeURI(msg)+"&userid="+encodeURI(id);
                var chatbox = $(this).parents().parents().parents().attr("rel");

                console.log("DE CORRECTE CHATBOX:" + chatbox);
                $('<div class="msg-right">'+msg+'</div>').insertBefore('[rel="'+chatbox+'"] .msg_push');
                $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                $.get(url);
            }
        }
    });



    function displayChatBox(){
        i = 270 ; // start position
        j = 260;  //next position

        $.each( arr, function( index, value ) {
            if(index < 4){
                $('[rel="'+value+'"]').css("right",i);
                $('[rel="'+value+'"]').show();
                i = i+j;
            }
            else{
                $('[rel="'+value+'"]').hide();
            }
        });
    }

    function updateMessages(){
        //select the messagep class and empties it
        $("div.msg_left").remove();
        //gets the json and sets it as the data which is used by the function
        $.getJSON("Controller?action=MessageList", function( data ) {
            //for each entry in data make a function with key and val
            $.each( data, function( key, val ) {
                //key is the id of the person
                //val is the array of the messages
                //for each entry in val make a function with i and value
                $.each(val, function(i, value){
                    //console.log(value.text);
                    //var chatbox = $(this).parents().parents().parents().attr("rel");
                    console.log(value);
                    var chatbox = value.from.userId;
                    $('<div class="msg-left">'+value.text+'</div>').insertBefore('[rel="'+chatbox+'"] .msg_push');
                    //$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                })
            });
        });
    }

});
