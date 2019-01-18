

$(document).ready(function () {
  $('#rfidinput').keyup(function () { 
    var value = $("#rfidinput").val();
    //alert(value)
  });

 
}); 

function changeImage(){
  setInterval(returnToLogo,3000)
}

function returnToLogo(){
  $("#logoimage").attr("src","/images/logo.png");
  $("#welcome").text("Please Swipe your card");
  $("#mynotice").text("");
  console.log("yeah");
}

function getChar(event){
  if(event.which != 0 && event.charCode != 0){
    return String.fromCharCode(event.which);
  }else{
    return null;
  }
}

function dayTypeChange(event){
  var sel = document.getElementById("dayselect");
  var selectValue = sel.options[sel.selectedIndex].value;
  //alert(selectValue);
  window.location.href = "/attendances?day_id=" + selectValue;

};




