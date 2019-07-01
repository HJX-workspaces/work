<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="sdlc.*"%>

<%
	String title="流浪地球";
	HelloWorldWeb poem=new HelloWorldWeb();
    String poemText=poem.getPoemContent();
%>
<!DOCTYPE html>

<html>

<head>

<style>
.background1 {
	background-image: url(${pageContext.request.contextPath}/static/imgs/pic008.jpg);
	background-color: #000000;
}
</style>

<script>
	function run(clickedObj) {
		$("#firstline").fadeOut('fast');
		$('#intr')[0].pause();
		$('#poem')[0].play();
		$('#poem-txt').fadeIn('fast');
		$(clickedObj).animate({
			width : '10px',
			opacity : '0.5',
			left : '1000px',
			top : '20px'
		}, 15000,function(){
			$(clickedObj).animate({
				width : '0px',
				opacity : '0',
				left : '1400px',
				top : '10px'
			},10000);
		});
		
		$("#moviebox").show('slow');
		$("#movie")[0].play();
	}
	function onVideoEnd(){
		
		$("#moviebox").fadeOut('slow');
		
		$("#hornor").fadeIn('slow');

		$("#hornor").animate({
			fontSize : '30px',
		    top:  '25%',
		    left: '50px'
		}, 3000);
		
		$('#poem-txt').fadeOut('slow');
		
		$('#poem-txt').animate({
			bottom : '100px',
			right : '100px'
		}, 18000);
		
		$('#waiting')[0].play();
	}
	function onWaitingAudioEnd(){
		$('#intr')[0].play();	
	}
</script>

<meta charset="UTF-8">

<title>The Wandering Earth</title>

<script src="${pageContext.request.contextPath}/static/jquery.min.js"></script>

</head>

<body class="background1">

	<audio 
		id="intr" 
		controls="controls"
		src="${pageContext.request.contextPath}/static/audio/introduction.mp3" 
		autoplay="autoplay">
	</audio>
		
	<audio 
		id="poem" 
		src="${pageContext.request.contextPath}/static/audio/wanderingEarch-poem.mp3"
		preload="auto">
	</audio>
		
    <span 
    	id="firstline" 
    	style="font-size: 22px; 
    	color: white">大家好，我与这学期学习“软件工程导论”的学生们准备设计和实现一个“
    	<span 
    		style="font-size: 38px; 
    		color: red"><%=title%>
    	</span>
    	”的模拟工程！ 欢迎大家观赏,谢谢！点击屏幕左下角的地球，可以开始悲壮的流浪！！
	</span>
	
	<audio 
		id="waiting" 
		src="${pageContext.request.contextPath}/static/audio/waiting.mp3" 
		preload="auto" 
		onended="onWaitingAudioEnd();">
	</audio>
	
	<div 
		id="poem-txt"
		style="display: none; 
		font-size: 30px; 
		color: orange; 
		position:absolute; 
		left :10px;
		bottom:200px" ><%=poemText%>
	</div>
	
	<img 
		src="${pageContext.request.contextPath}/static/imgs/earth.png"
		style="position: absolute; left: 10px; bottom: 10px; width: 150px"
		onclick="run(this);return false" 
		title="点击后，开始流浪 ！"/>
		
	<div 
		id="moviebox" 
		style="margin-top: 100px; 
		display: none"
		align="center">
		
		<video 
			id="movie" 
			height="300px" 
			controls="controls"
			src="${pageContext.request.contextPath}/static/video/movie.mp4" 
			onended="onVideoEnd();" >
		</video>
		
	</div>
	
	<div 
	id="hornor" 
	style="display:none;
	position:absolute;
	left:10x; 
	bottom:10px;
	color:white;
	font-size:24px" 
	align="center">2019年发生了很多大事，谨以此向<span 
	style="color:red">《流浪地球》</span>和<span 
	style="color:orange">华为公司</span>表示致敬 !  
	<br/>本网页未来将放在以下网站 sdlc.huaku-2019.xyz (华为公司的云服务器) 
	<br/> huaku-2019, 2019 年，《流浪地球》 和华为很酷！ <br/>也许华为的崛起意味着，在人类未来需要流浪地球时，东方大国将作出巨大的贡献 ！
	</div>
	
</body>

</html>