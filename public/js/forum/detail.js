/**
 * Created by lsh_monster on 2015/5/8.
 */
window.onload=function(){
    $('.writeComment').click(
        function(){
            document.getElementById("comment").setAttribute('autofocus',true);
            //$('textarea')[0].focus();
        }

    );//还没写完，点击写评论的按钮，使得评论文本域获得焦点

    $('#commentButton').click(
        function(){
           // alert("dhe");
        }
    );
}