<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="resources/css/together/together.css"> -->
<style type="text/css">
nav#navigationBar {
	margin-bottom : 0px;
}
#imagetrevel {
	padding: 0;
	background: url("resources/images/sns/trevel.jpg") center no-repeat;
	background-size: cover;
}
div.transbox {
    margin: 20px 0;
    background-color: #ffffff;
    border: 1px solid black;
    opacity: 0.6;
    filter: alpha(opacity=60); /* For IE8 and earlier */
}

div.transbox h1, h3 {
    margin: 5%;
    color: #000000;
}

div.transbox h1 {
    font-weight: bold;
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

#plan .row > div:nth-child(4n+1) {
	clear: both;
}
</style>