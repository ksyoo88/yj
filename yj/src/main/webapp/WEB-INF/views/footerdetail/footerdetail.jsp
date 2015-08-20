<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>여기 저기 - 여행의 그 끝은 어디 </title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link href="resources/css/footer/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/css/footer/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top"  onclick = $("#menu-close").click(); >Start Bootstrap</a>
            </li>
            <li>
                <a href="#top" onclick = $("#menu-close").click(); >Home</a>
            </li>
            <li>
                <a href="#about" onclick = $("#menu-close").click(); >About</a>
            </li>
            <li>
                <a href="#services" onclick = $("#menu-close").click(); >Services</a>
            </li>
            <li>
                <a href="#portfolio" onclick = $("#menu-close").click(); >Portfolio</a>
            </li>
            <li>
                <a href="#contact" onclick = $("#menu-close").click(); >Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div style="text-shadow: 2px 2px gray;" class="text-vertical-center">
            <h1><strong>여기저기</strong></h1>
            <h3><strong>여행을 기획하고 공유해보세요. 최고의 여행파트너와 공유합니다.</strong></h3>
            <br>
            <a href="#about" class="btn btn-dark btn-lg">들어가기</a>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2><strong>미리 떠나는 나만의 여행 시작해 볼까요?</strong></h2>
                    <p class="lead"><strong>나만의 <a href="#portfolio" onclick = $("#menu-close").click();">여행</a>을 만들어 보세요.</strong></p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>팀 소개</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                                <img src="resources/css/footer/img/icon_taemin.png" width="120px" height="120px">
                                <h4>
                                    <strong>곽태민</strong>
                                </h4>
                                <p>저는 정상입니다.</p>
                                <p>ktm30702@naver.com</p>
<!--                                 <a href="#" class="btn btn-light">Learn More</a> -->
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                            	<img src="resources/css/footer/img/icon_bird.png" width="120px" height="120px">
<!--                                 <span class="fa-stack fa-4x"> -->
<!--                                 <i class="fa fa-circle fa-stack-2x"></i> -->
<!--                                 <i class="fa fa-compass fa-stack-1x text-primary"></i> -->
                                <h4>
                                    <strong>유관수</strong>
                                </h4>
                                <p>구구구구구구구구구...구구구? 구구구!</p>
                                <p>ksyoo88@naver.com</p>
<!--                                 <a href="#" class="btn btn-light">Learn More</a> -->
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="service-item">
                               <img src="resources/css/footer/img/icon_soccer.png" width="120px" height="120px">
                                <h4>
                                    <strong>정우호</strong>
                                </h4>
                                <p>내꿈은 축구왕. 세계에서 제일가는 스트라이커!</p>
                                <p>wooho1108@naver.com</p>
<!--                                 <a href="#" class="btn btn-light">Learn More</a> -->
                            </div>
                        </div>                       
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center" >
            <h2><strong>여기저기에서 함께 놀고</strong></h2>
            <h2><strong>여기저기로 함께 여행하고 여기저기에서 함께 여행의 추억을 간직하세요.</strong></h2>
        </div>
    </aside>

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h2>여기 추천을 통해 이곳으로 계획을 만드세요!</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                    <img class="img-portfolio img-responsive" src="resources/css/footer/img/footer06.jpg">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                    <img class="img-portfolio img-responsive" src="resources/css/footer/img/footer02.jpg">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                    <img class="img-portfolio img-responsive" src="resources/css/footer/img/footer01.jpg">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                    <img class="img-portfolio img-responsive" src="resources/css/footer/img/footer04.jpg">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Call to Action -->
    <aside class="call-to-action bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
               		<img src="resources/css/footer/img/icon_computer.png" width="120px" height="120px">
                    <h1>Thanks To</h1>
                    <h3>이응수 강사님 남지숙 매니져님</h3>
                    <h4> 덕경 / 주윤 / 이상한효길 / 딸기진호 / 철우 / 종현</h4>
                    <h4>쿨성수 / ㅈ뉴비재만/ 태정 / 재식 / 찬현 / 선경 </h4>
                    <h4>정욱 / 한온 / 불만경택 / 조약빨 / 울보라 / 준영</h4>
                    <h4>노예창진 / 박지니어스 / 성현 </h4>
                    <h4></h4>
                    <h4></h4>
                    <a href="#top" onclick = $("#menu-close").click(); class="btn btn-lg btn-light">맨 위로</a>
                    <a href="main.do" class="btn btn-lg btn-dark">들어가기!</a>
                </div>
            </div>
        </div>
    </aside>


    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Travel Maker</strong>
                    </h4>
                    <p>인천시 부평구 일신동<br>풍림아파트 105동 905호 403-110</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (010) 6222-7216</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">yogijogi3@gmail.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="https://instagram.com/tminging"><i class="fa fa-instagram fa-fw fa-3x"></i></a>
                            <p>곽태민</p>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/profile.php?id=100004472101535"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                            <p>유관수</p>
                        </li>
                        <li>
                            <a href="https://instagram.com/_wooho"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            <p>정우호</p>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="resources/js/jquery/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/css/footer/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>

</body>

</html>
