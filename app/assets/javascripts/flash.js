$(function() {
var flashNoticeTimeOut = function(){
  if($('#flash_notice').text().length > 0 ){
	$('#flash_notice').show();
	setTimeout(function(){ $('#flash_notice').text(''); $('#flash_notice').hide(); }, 5000);
  }
},
init=function(){
flashNoticeTimeOut();
}
init();
});
