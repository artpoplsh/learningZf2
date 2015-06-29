/**
 * Created by lsh_monster on 2015/5/2.
 */
window.onload=function() {
    $("li a").each(function () {
        $this = $(this);
        if ($this[0].href == String(window.location.href)) {
            $this.parent().addClass("active");
        }
    });
    $('#changeSkin').hover(
        function () {
            // alert('over');
            this.style.cursor = "Pointer";
        },
        function () {
            // alert('out');
        }
    );
    $('#changeSkin').click(
        function () {
            if ($('.skinView').get(0).style.display == 'none') {
                // $('.skinView').removeAttr('style', 'display:none');
                $('.skinView').slideDown("fast");
            } else {
                $('.skinView').slideUp("fast");
            }
        }
    );

    $(".bg").click(
        function () {
            $('.skinView').slideUp("normal");
            $('body').css({'background-image': 'url("../img/body_bg.jpg")', 'background-color': 'rgb(245,233,211)'});
        }
    )
    $(".bg1").click(
        function () {
            $('.skinView').slideUp("fast");
            $('body').css({'background-image': 'url("../img/body_bg1.jpg")', 'background-color': 'rgb(28,14,40)'});

        }
    )
    $(".bg2").click(
        function () {
            $('.skinView').slideUp("slow");
            $('body').css({'background-image': 'url("../img/body_bg2.jpg")', 'background-color': 'rgb(180,218,239)'});

        }
    )
    $(".foldChat").hover(
        function () {
            // alert('over');
            this.style.cursor = "Pointer";
        },
        function () {
            // alert('out');
        }
    );
    $(".foldChat").click(
        function () {
            getfollows();
            $(".foldChat").slideUp("slow");
            $('.chatWindow').fadeIn("fast");
        }
    );
    $(".glyphicon-remove").hover(
        function () {
            // alert('over');
            this.style.cursor = "Pointer";
        },
        function () {
            // alert('out');
        }
    );
    $(".glyphicon-remove").click(
        function () {
            $('.chatWindow').slideUp("fast");
            $(".foldChat").slideDown("slow");
            $(".followsLi").remove();
        }
    );
    $(document).on('mouseenter', '.followsLi', function(e) {

        this.style.cursor = "Pointer";


    });

    $(document).on('click', '.followsLi', function(e) {
       window.name=this.innerHTML;
       $(".chatTitle").replaceWith("<span class='chatTitle'>正在与<strong>"+this.innerHTML+"</strong>聊天</span>");
        getAllmsg();

        getmsg();
    });
    $("#send").click(
        function(){
            if($(".chatTitle").html()==""||$(".chatTitle").html()=="<strong>请选择聊天对象</strong>"){
                $(".chatTitle").replaceWith("<span class='chatTitle'><strong>请选择聊天对象</strong></span>");
                $(".chatTitle").fadeOut(100).fadeIn(100);
            }else {
                sendmsg();
            }
        }
    );

    //window.setInterval(getmsg,1000);


    function getmsg(){//获取未读消息
        var url="/Chat/getMes";
        //var data="sender="+window.name;
        //alert(data);
        var xhr=new XMLHttpRequest();
        xhr.open("post",url,true);
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4){
                if(xhr.status==200){
                    var msg=xhr.responseText;
                    var res = eval('(' + msg + ')');
                    //alert(msg);
                    if((length=res.length)!=0){
                        // alert(length);
                        for(var i=0;i<length;i++){
                            //alert(res[i].content+" "+res[i].time);
                         $("textarea").val($("textarea").val() + "\r\n" +res[i].sender+": "+res[i].content+" "+res[i].time);

                        }
                    }
                }else{

                }
            }
        }
        xhr.send(null);
    }



    function sendmsg(){
        var content=$(".editText").val();
        if(content==""){
            $(".editText").focus();
        }else{
            var url="/Chat/sendMes";
            var data="getter="+window.name+"&content="+content;
            //alert(data);
            var xhr=new XMLHttpRequest();
            xhr.open("post",url,true);
            xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            xhr.onreadystatechange=function(){
                if(xhr.readyState==4){
                    if(xhr.status==200){
                        var msg=xhr.responseText;
                        //alert(msg);
                    }else{

                    }
                }
            }
            xhr.send(data);
            $(".editText").val('');
            var date = new Date();
            $("textarea").val($("textarea").val() + "\r\n" +content);
        }
    }


    function getAllmsg(){//获取历史记录
        var url="/Chat/getAllMes";
        //alert(window.name);
        var data="sender="+window.name;
        var xhr=new XMLHttpRequest();
        xhr.open("post",url,true);
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4){
                if(xhr.status==200){
                    var msg=xhr.responseText;
                    var res = eval('(' + msg + ')');
                    //alert(msg);
                    $("textarea").val("");
                    if((length=res.length)!=0){

                        for(var i=0;i<length;i++){
                            //alert(res[i].content+" "+res[i].time);
                            $("textarea").val($("textarea").val() + "\r\n" +res[i].sender+": "+res[i].content+" "+res[i].time);
                        }
                        //$("textarea").append("<span>以上为历史消息</span>");
                        $("textarea").val($("textarea").val()+ "\r\n" + "*******以上为历史消息*******");
                    }
                }else{

                }
            }
        }
        xhr.send(data);
    }



    function getfollows() {
        //var data="dcn";
        var url = "/Chat/getFriendList";
        //alert(url);
        var xhr = new XMLHttpRequest();

        xhr.open("get", url, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    var msg = xhr.responseText;
                    var res = eval('(' + msg + ')');
                    if((length=res.length)!=0){
                         //alert(length);
                        for(var i=0;i<length;i++){
                            $(".follows").append("<li class='followsLi'>"+res[i].follows+"</li>");
                        }

                        }
                }else{
                    alert(xhr.status);
                }
            }

        }
        xhr.send(null);
    }
}