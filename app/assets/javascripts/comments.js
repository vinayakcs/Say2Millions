$(function() {
var editClickListener= function(){
$('.comment_edit_icon').on('click',function(){
console.log("SSSS");
$(this).siblings('#comment_edit').toggle();
});
},
init=function(){
editClickListener();
};
editClickListener();
});
