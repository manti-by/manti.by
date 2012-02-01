/**
  * Default template js file
  * @package M2 Micro Framework
  * @subpackage Template
  * @author Alexander Chaika
  */

$(document).ready(function(){
    $('.hide_this').click(function() {
        $(this).parent('div').fadeOut(400);
    });
});