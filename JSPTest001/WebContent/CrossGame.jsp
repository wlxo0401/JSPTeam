<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
<title>��ٸ� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script language="javascript" type="text/javascript">


var n;
var point = -50;
var Yl = {
 getEl : function(strId){
  if (document.getElementById) return document.getElementById(strId);
  if (document.all) return document.all[strId];
 }
 //div ����
 ,getDiv : function(sWidth, sHeight, sBgColor){
  var d = document.createElement("div");
  if(sWidth) d.style.width = sWidth;
  if(sHeight) d.style.height = sHeight;
  if(sBgColor) d.style.backgroundColor = sBgColor;
  d.style.position = "absolute";
  d.style.overflow = "hidden";
  return d;
 }
 ,arrColor : [
  '#8c7301','#9b014f','#0084a0','#ad8e00','#bb005f'
  ,'#00a0c2','#8d3901','#8f0197','#156200','#9ca53b'
  ,'#c9a601','#d6006d','#01b6de','#80adaf','#a44201'
  ,'#e0b800','#ec0078','#0021b0','#92b7d7','#013add'
  ]
 ,arrVerDiv : [] //���� �� div
 ,arrHorDiv : [] //���� �� div
 ,arrMovDiv : [] //�̵� �� div

 ,arrIng : [] //���࿩�� üũ��

 ,arrMDiv : [] //�̵��� �迭 ��ȣ�� ����, �̵��� Ȯ�ο�

 ,nMaxWidth : 1000 //�ְ� ����
 ,nWidth : 0 //��ٸ� ����
 ,nHeight : 300 //��ٸ� ����

 ,nNum : 0

 ,arrTopDiv : [] //ž div
 ,arrBotDiv : [] //�Ʒ� div
 ,arrGoDiv : [] //go ��ư div

 ,init : function(){

  //����
  this.nNum = parseInt(this.getEl("sel_num").value);

  //����
  this.nWidth = parseInt(this.nMaxWidth/this.nNum);

  for(var i=0; i<this.nNum; i++){

   this.arrTopDiv[i] = this.getDiv(this.nWidth+"px", "50px", "");
   this.arrBotDiv[i] = this.getDiv(this.nWidth+"px", "50px", "");
   this.arrGoDiv[i] = this.getDiv(this.nWidth+"px", "30px", "");

   this.arrTopDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrTopDiv[i].style.top = "20px";

   this.arrBotDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrBotDiv[i].style.top = "410px";

   this.arrGoDiv[i].style.left = (i*this.nWidth)+"px";
   this.arrGoDiv[i].style.top = "70px";

   this.arrTopDiv[i].style.fontSize="12px";
   this.arrBotDiv[i].style.fontSize="12px";

   //this.arrTopDiv[i].style.border = "1px solid #CCCCCC";
   //this.arrBotDiv[i].style.border = "1px solid #CCCCCC";

   this.arrTopDiv[i].align = "center";
   this.arrBotDiv[i].align = "center";
   this.arrGoDiv[i].align = "center";

   this.arrTopDiv[i].innerHTML = (i+1) + '<p><input type="button" value="����" id="inp_top_'+i+'"class="btn btn-success" onclick="Yl.create('+i+');">'/*+'<br><input type="text" id="inp_top_'+i+'" value="" style="width:90%" tabindex="'+(i+1)+'" />'*/;
   if(i!=this.nNum-1){
	   this.arrBotDiv[i].innerHTML = '<input type="text" id="inp_bot_'+i+'" value="��" style="width:90%" tabindex="'+((i+1)+50)+'" />';
   }else{
	   this.arrBotDiv[i].innerHTML = '<input type="text" id="inp_bot_'+i+'" value="��÷" style="width:90%" tabindex="'+((i+1)+50)+'" />';
   }
   
   
   

   this.getEl("div_body").appendChild(this.arrTopDiv[i]);
   this.getEl("div_body").appendChild(this.arrBotDiv[i]);
   this.getEl("div_body").appendChild(this.arrGoDiv[i]);


   this.arrVerDiv[i] = this.getDiv("1px", this.nHeight+"px", "#bbbbbb");

   this.arrVerDiv[i].style.left = ( (i*this.nWidth)+parseInt(this.nWidth/2) )+"px";
   this.arrVerDiv[i].style.top = "100px";

   this.getEl("div_body").appendChild(this.arrVerDiv[i]);

  }
  

  this.getEl("div_step1").style.display = "none";
  this.getEl("div_step2").style.display = "";

 }
 ,create : function(tn){ //��ٸ� ����
	 n = tn;
  for(var i=0; i<this.nNum; i++){

   this.arrTopDiv[i].innerHTML = (i+1);
   this.arrBotDiv[i].innerHTML = this.getEl("inp_bot_"+i).value;
   if(n==i){
	   this.arrGoDiv[i].innerHTML = '<input type="button" class="btn btn-success" value="GO" onClick="Yl.start('+i+')">';   
   }  

   this.arrTopDiv[i].style.overflow = "auto";
   this.arrBotDiv[i].style.overflow = "auto";

   this.arrIng[i] = false;

   this.arrMDiv[i] = [];
  }

  for(var i=0; i<(this.nNum*7); i++){

   var nLen = this.arrHorDiv.length;

   this.arrHorDiv[nLen] = this.getDiv(this.nWidth+"px","1px", "#aaaaaa");

   var nRndLeft = (parseInt(Math.random()*(this.nNum-1))*this.nWidth)+parseInt(this.nWidth/2);
   var nRndTop = this.getRndTop();

   this.arrHorDiv[nLen].style.left = nRndLeft+"px";
   this.arrHorDiv[nLen].style.top = nRndTop+"px";

   this.getEl("div_body").appendChild(this.arrHorDiv[nLen]);
  }

  //this.getEl("div_step2").innerHTML = "<center>" + '<a href="PointChangeSave.jsp?_point='+point+'&_type=game">����Ʈ ���� Ȯ��</a></center>';

 }
 ,sRndTop : ""
 ,getRndTop : function(){
  var nRnd = parseInt(Math.random()*(this.nHeight-100))+150;

  if( this.sRndTop.indexOf( "["+nRnd+"]" ) < 0 ){
   this.sRndTop += "["+nRnd+"]";
   return nRnd;
  }else{
   return this.getRndTop();
  }
 }
 ,start : function( no ){

  if( this.arrIng[no] ){
   for(var i=0; i<this.arrMDiv.length; i++){
    for(var j=0; j<this.arrMDiv[i].length; j++){
     this.arrMovDiv[this.arrMDiv[i][j]].style.backgroundColor = "#CCCCCC";
     this.arrMovDiv[this.arrMDiv[i][j]].style.zIndex = 1;
    }

   }
   for(var i=0; i<this.arrMDiv[no].length; i++){
    this.arrMovDiv[this.arrMDiv[no][i]].style.backgroundColor = "#0000ff";
    this.arrMovDiv[this.arrMDiv[no][i]].style.zIndex = 2;
   }
  }else{

   var nSx = parseInt(this.arrVerDiv[no].style.left);
   var nSy = parseInt(this.arrVerDiv[no].style.top);

   this.moveStart("y", no, nSx, nSy);

   this.arrIng[no] = true; //����
  }

 }
 ,moveStart : function(sXy, pno, nSx, nSy){

  var nLen = this.arrMovDiv.length;

  this.arrMovDiv[nLen] = this.getDiv("2px","2px", this.arrColor[pno]);

  this.arrMDiv[pno].push(nLen);

  this.getEl("div_body").appendChild(this.arrMovDiv[nLen]);

  this.arrMovDiv[nLen].style.left = nSx+"px";
  this.arrMovDiv[nLen].style.top = nSy+"px";

  this.arrMovDiv[nLen].style.zIndex = 3;


  var nEx = nSx;
  var nEy = nSy;
  if(sXy=="y") nEy = this.nHeight+100;

  var bCk = false;

  for(var i=0; i<this.arrHorDiv.length; i++){

   var nx = parseInt(this.arrHorDiv[i].style.left);
   var ny = parseInt(this.arrHorDiv[i].style.top);
   var nw = parseInt(this.arrHorDiv[i].style.width);
   var nh = parseInt(this.arrHorDiv[i].style.height);

   if(sXy=="x"){
    if( ny == nSy ){
     if( nx==nSx ){
      nEx = nx+nw;
      break;
     }else if( (nx+nw)==nSx ){
      nEx = nx;
      break;
     }
    }
   }else{

    //�ݺ��ϸ鼭 ū���߿��� ���� ����������
    if( ny>nSy ){

     if( nx==nEx || (nx+nw)==nEx ){

      if(bCk){
       if(ny<nEy) nEy = ny;
      }else
       nEy = ny;

      bCk = true;
     }
    }
   }
  }

  this.move(nLen, pno, nSx, nSy, nEx, nEy);
 }
 ,nSpeed : 10
 ,move : function(no, pno, nSx, nSy, nEx, nEy){

  var nx = parseInt(this.arrMovDiv[no].style.left);
  var ny = parseInt(this.arrMovDiv[no].style.top);
  var nw = parseInt(this.arrMovDiv[no].style.width);
  var nh = parseInt(this.arrMovDiv[no].style.height);

  var np;
  var bIng = true;

  var sXy = "";

  if( nSx != nEx ){
   np = nw+this.nSpeed;
   if(nEx<nSx){
    if( (nSx-np) <= nEx ){
     bIng = false;
     np = nSx-nEx;
    }
    this.arrMovDiv[no].style.left = (nSx-np)+"px";
   }else{
    if( (nSx+np) >= nEx ){
     bIng = false;
     np = nEx-nSx;
    }
   }

   this.arrMovDiv[no].style.height = "4px";
   this.arrMovDiv[no].style.width = np+"px";

   sXy = "x";
  }else{

   np = nh+this.nSpeed;
   if( (nSy+np) >= nEy ){
    bIng = false;
    np = nEy-nSy;
   }

   this.arrMovDiv[no].style.width = "4px";
   this.arrMovDiv[no].style.height = np+"px";

   sXy = "y";
  }


  if(bIng){

   setTimeout("Yl.move("+no+","+pno+","+nSx+","+nSy+","+nEx+","+nEy+")", 1);

  }else{

   if((sXy=="x")) this.arrMovDiv[no].style.height = "2px";
   else this.arrMovDiv[no].style.width = "2px";

   if( nEy<this.nHeight+100 ){
    this.moveStart((sXy=="x")?"y":"x", pno, nEx, nEy);
   }else{

    for(var i=0; i<this.arrVerDiv.length; i++){
     if(nEx==parseInt(this.arrVerDiv[i].style.left)){
    	 if(i!=this.arrVerDiv.length-1){
    		 this.arrBotDiv[i].innerHTML = "<b>"+(pno+1)+"</b><br>"+this.arrBotDiv[i].innerHTML;
    	 }else{
    		 this.arrBotDiv[i].innerHTML = "<b>"+(pno+1)+"</b><br>"+this.arrBotDiv[i].innerHTML;
    		 if(pno==n){
    			 point = 50;
    		 }
    	 }
      

      this.arrGoDiv[pno].innerHTML = '<a href="PointChangeSave.jsp?_point='+point+'&_type=game">����Ʈ ���� Ȯ��</a></center>';

      break;
     }
    }
   }
  }
 }
};

//F5 ���ΰ�ħ ����
document.onkeydown = function(e){
 if(!e) e = window.event;
 if (e.keyCode == 116){
  if( confirm("���� ��ħ �Ͻðڽ��ϱ�?") ){
  }else{
   e.keyCode = 0;
   return false;
  }
 }
}

</script>

</head>

<body>

<%
String id = (String)session.getAttribute("__id");
if(id==null){
	id = "ID101";
}
%>

<div id="div_step1" style="font-size:12px;">

���� ����
<select id="sel_num">
 <option value="2">2</option>
 <option value="3">3</option>
 <option value="4">4</option>
 <option value="5" selected >5</option>
 <option value="6">6</option>
 <option value="7">7</option>
 <option value="8">8</option>
 <option value="9">9</option>
 <option value="10">10</option>
 <option value="11">11</option>
 <option value="12">12</option>
 <option value="13">13</option>
 <option value="14">14</option>
 <option value="15">15</option>
 <option value="16">16</option>
 <option value="17">17</option>
 <option value="18">18</option>
 <option value="19">19</option>
 <option value="20">20</option>
</select>
��

<input type="button" class="btn btn-success" value="�����" onclick="Yl.init();">

</div>


<div id="div_step2" style="font-size:12px;display:none;">

</div>



<div id="div_body" style="width:1000px;height:450px;border:1px solid #CCCCCC;position:relative;"></div>

</body>

</html>