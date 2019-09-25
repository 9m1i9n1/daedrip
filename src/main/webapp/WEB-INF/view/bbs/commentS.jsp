<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<script>
var bbs_idx = '${read.idx}'; //게시글 번호
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 

//댓글 목록 
function commentList(){
    console.log("들어오나?");
    
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'bbs_idx':bbs_idx},
        success : function(data){
            var a =''; 

            console.log('#data: ' + data);

            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.idx+'">'+'댓글번호 : '+value.idx+' / 작성자 : '+value.account_idx;
                a += '<a onclick="commentUpdate('+value.idx+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.idx+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.idx+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });

            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(idx, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+idx+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+idx+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+idx).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(idx){
    var updateContent = $('[name=content_'+idx+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'idx' : idx},
        success : function(data){
            if(data == 1) commentList(bbs_idx); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(idx){
    $.ajax({
        url : '/comment/delete/'+idx,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bbs_idx); //댓글 삭제후 목록 출력 
        }
    });
}
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});

</script>


