<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/mypage/mypage.css">
<style type="text/css">

.mypage-header {
	padding: 4px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

nav#navigationBar {
	margin-bottom : 0px;
}
#profileimg:hover {
	opacity: 0.4;
    filter: alpha(opacity=40);
}
#profile:hover { 
	display:"block";
}

.mypage-header {
	text-align: center;
}

/* ======================  image list  ============================ */
.thumbnail {
    position:relative;
    overflow:hidden;
}
 
.caption {
    position:absolute;
    top:0;
    right:0;
    background:rgba(66, 139, 202, 0.75);
    width:100%;
    height:100%;
    padding:2%;
    display: none;
    text-align:center;
    color:#fff !important;
    z-index:2;
}

#loading-indicator {
  position: fixed;
  left: 49%;
  top: 90%;
}

div.imageList {
	border: 1px solid red;
}
</style>