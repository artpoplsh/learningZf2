window.onload=function(){
    $("#modifySpan").hover(
        function(){
            // alert('over');
            this.style.cursor="Pointer";
        },
        function(){
            // alert('out');
        }
    );
    $('#modifySpan').click(function(){
        $('#modify').attr('style','display:none');
        $('#save').removeAttr('style','display:none');
    });

    $("#saveSpan").hover(
        function(){
            // alert('over');
            this.style.cursor="Pointer";
        },
        function(){
            // alert('out');
        }
    );
    $('#saveSpan').click(function(){
        $('#save').attr('style','display:none');
        $('#modify').removeAttr('style','display:none');
        $('#saveForm').submit();
    });
}