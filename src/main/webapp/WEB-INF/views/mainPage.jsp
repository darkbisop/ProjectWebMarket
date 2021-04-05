<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<%--<html lang="en-US">--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Bolby - Portfolio/CV/Resume HTML Template</title>
    <meta name="description" content="Bolby - Portfolio/CV/Resume HTML Template">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" type="/resources/resume/image/x-icon" href="https://via.placeholder.com/32x32">

    <!-- STYLESHEETS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/bootstrap.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/all.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/simple-line-icons.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/slick.css" type="text/css" media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/animate.css" type="text/css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/magnific-popup.css" type="text/css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/resume/css/style.css" type="text/css" media="all">

    <!--[if lt IE 9]>w
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="dark">

<!-- Preloader -->
<div id="preloader">
    <div class="outer">
        <!-- Google Chrome -->
        <div class="infinityChrome">
            <div></div>
            <div></div>
            <div></div>
        </div>

        <!-- Safari and others -->
        <div class="infinity">
            <div>
                <span></span>
            </div>
            <div>
                <span></span>
            </div>
            <div>
                <span></span>
            </div>
        </div>
        <!-- Stuff -->
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="goo-outer">
            <defs>
                <filter id="goo">
                    <feGaussianBlur in="SourceGraphic" stdDeviation="6" result="blur" />
                    <feColorMatrix in="blur" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
                    <feBlend in="SourceGraphic" in2="goo" />
                </filter>
            </defs>
        </svg>
    </div>
</div>

<!-- desktop header -->
<header class="desktop-header-3 fixed-top">

    <div class="container">

        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/resume/images/logo.svg" alt="Bolby" /></a> <button aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarNavDropdown" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto scrollspy">
                    <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
                    <li class="nav-item"><a href="#about" class="nav-link">About</a></li>
                    <li class="nav-item"><a href="#services" class="nav-link">Skills</a></li>
                    <li class="nav-item"><a href="#experience" class="nav-link">Experience</a></li>
                    <li class="nav-item"><a href="#works" class="nav-link">Portfolio</a></li>
                    <a href="${pageContext.request.contextPath}/mainPage?lang=ko">한국어</a> /
                    <a href="${pageContext.request.contextPath}/mainPage?lang=ja">日本語</a>
                </ul>
            </div>
        </nav>

    </div>

</header>

<!-- main layout -->
<main class="content-3">

    <!-- section home -->
    <section id="home" class="home d-flex align-items-center">
        <div class="container">

            <!-- intro -->
            <div class="intro">
                <!-- avatar image -->
                <img src="${pageContext.request.contextPath}/resources/resume/images/me.png" alt="" class="mb-4" />

                <!-- info -->
                <h1 class="mb-2 mt-0"><spring:message code="message.mainPage.myName" /></h1>
               <%-- <span>I'm a <span class="text-rotating">UI/UX designer, Front-End developer, Photography lover</span></span>--%>
                <span><spring:message code="message.mainPage.simpleIntro" /></span>

                <!-- buttons -->
                <div class="mt-4">
                    <a href="#works" class="btn btn-default">Portfolio</a>
                </div>
            </div>

            <!-- scroll down mouse wheel -->
            <div class="scroll-down">
                <a href="#about" class="mouse-wrapper">
                    <span>Scroll Down</span>
                    <span class="mouse">
						<span class="wheel"></span>
					</span>
                </a>
            </div>

            <!-- parallax layers -->
            <div class="parallax" data-relative-input="true">

                <svg width="27" height="29" data-depth="0.3" class="layer p1" xmlns="http://www.w3.org/2000/svg"><path d="M21.15625.60099c4.37954 3.67487 6.46544 9.40612 5.47254 15.03526-.9929 5.62915-4.91339 10.30141-10.2846 12.25672-5.37122 1.9553-11.3776.89631-15.75715-2.77856l2.05692-2.45134c3.50315 2.93948 8.3087 3.78663 12.60572 2.22284 4.297-1.5638 7.43381-5.30209 8.22768-9.80537.79387-4.50328-.8749-9.08872-4.37803-12.02821L21.15625.60099z" fill="#FFD15C" fill-rule="evenodd"/></svg>

                <svg width="26" height="26" data-depth="0.2" class="layer p2" xmlns="http://www.w3.org/2000/svg"><path d="M13 3.3541L2.42705 24.5h21.1459L13 3.3541z" stroke="#FF4C60" stroke-width="3" fill="none" fill-rule="evenodd"/></svg>

                <svg width="30" height="25" data-depth="0.3" class="layer p3" xmlns="http://www.w3.org/2000/svg"><path d="M.1436 8.9282C3.00213 3.97706 8.2841.92763 14.00013.92796c5.71605.00032 10.9981 3.04992 13.85641 8 2.8583 4.95007 2.8584 11.0491-.00014 16.00024l-2.77128-1.6c2.28651-3.96036 2.28631-8.84002.00011-12.8002-2.2862-3.96017-6.5124-6.40017-11.08513-6.4-4.57271.00018-8.79872 2.43984-11.08524 6.4002l-2.77128-1.6z" fill="#44D7B6" fill-rule="evenodd"/></svg>

                <svg width="15" height="23" data-depth="0.6" class="layer p4" xmlns="http://www.w3.org/2000/svg"><rect transform="rotate(30 9.86603 10.13397)" x="7" width="3" height="25" rx="1.5" fill="#FFD15C" fill-rule="evenodd"/></svg>

                <svg width="15" height="23" data-depth="0.2" class="layer p5" xmlns="http://www.w3.org/2000/svg"><rect transform="rotate(30 9.86603 10.13397)" x="7" width="3" height="25" rx="1.5" fill="#6C6CE5" fill-rule="evenodd"/></svg>

                <svg width="49" height="17" data-depth="0.5" class="layer p6" xmlns="http://www.w3.org/2000/svg"><g fill="#FF4C60" fill-rule="evenodd"><path d="M.5 16.5c0-5.71709 2.3825-10.99895 6.25-13.8567 3.8675-2.85774 8.6325-2.85774 12.5 0C23.1175 5.50106 25.5 10.78292 25.5 16.5H23c0-4.57303-1.90625-8.79884-5-11.08535-3.09375-2.28652-6.90625-2.28652-10 0C4.90625 7.70116 3 11.92697 3 16.5H.5z"/><path d="M23.5 16.5c0-5.71709 2.3825-10.99895 6.25-13.8567 3.8675-2.85774 8.6325-2.85774 12.5 0C46.1175 5.50106 48.5 10.78292 48.5 16.5H46c0-4.57303-1.90625-8.79884-5-11.08535-3.09375-2.28652-6.90625-2.28652-10 0-3.09375 2.28651-5 6.51232-5 11.08535h-2.5z"/></g></svg>

                <svg width="26" height="26" data-depth="0.4" class="layer p7" xmlns="http://www.w3.org/2000/svg"><path d="M13 22.6459L2.42705 1.5h21.1459L13 22.6459z" stroke="#FFD15C" stroke-width="3" fill="none" fill-rule="evenodd"/></svg>

                <svg width="19" height="21" data-depth="0.3" class="layer p8" xmlns="http://www.w3.org/2000/svg"><rect transform="rotate(-40 6.25252 10.12626)" x="7" width="3" height="25" rx="1.5" fill="#6C6CE5" fill-rule="evenodd"/></svg>

                <svg width="30" height="25" data-depth="0.3" data-depth-y="-1.30" class="layer p9" xmlns="http://www.w3.org/2000/svg"><path d="M29.8564 16.0718c-2.85854 4.95114-8.1405 8.00057-13.85654 8.00024-5.71605-.00032-10.9981-3.04992-13.85641-8-2.8583-4.95007-2.8584-11.0491.00014-16.00024l2.77128 1.6c-2.28651 3.96036-2.28631 8.84002-.00011 12.8002 2.2862 3.96017 6.5124 6.40017 11.08513 6.4 4.57271-.00018 8.79872-2.43984 11.08524-6.4002l2.77128 1.6z" fill="#6C6CE5" fill-rule="evenodd"/></svg>

                <svg width="47" height="29" data-depth="0.2" class="layer p10" xmlns="http://www.w3.org/2000/svg"><g fill="#44D7B6" fill-rule="evenodd"><path d="M46.78878 17.19094c-1.95535 5.3723-6.00068 9.52077-10.61234 10.8834-4.61167 1.36265-9.0893-.26708-11.74616-4.27524-2.65686-4.00817-3.08917-9.78636-1.13381-15.15866l2.34923.85505c-1.56407 4.29724-1.2181 8.92018.90705 12.12693 2.12514 3.20674 5.70772 4.5107 9.39692 3.4202 3.68921-1.0905 6.92581-4.40949 8.48988-8.70673l2.34923.85505z"/><path d="M25.17585 9.32448c-1.95535 5.3723-6.00068 9.52077-10.61234 10.8834-4.61167 1.36264-9.0893-.26708-11.74616-4.27525C.16049 11.92447-.27182 6.14628 1.68354.77398l2.34923.85505c-1.56407 4.29724-1.2181 8.92018.90705 12.12692 2.12514 3.20675 5.70772 4.5107 9.39692 3.4202 3.68921-1.0905 6.92581-4.40948 8.48988-8.70672l2.34923.85505z"/></g></svg>

                <svg width="33" height="20" data-depth="0.5" class="layer p11" xmlns="http://www.w3.org/2000/svg"><path d="M32.36774.34317c.99276 5.63023-1.09332 11.3614-5.47227 15.03536-4.37895 3.67396-10.3855 4.73307-15.75693 2.77837C5.76711 16.2022 1.84665 11.53014.8539 5.8999l3.15139-.55567c.7941 4.50356 3.93083 8.24147 8.22772 9.8056 4.29688 1.56413 9.10275.71673 12.60554-2.2227C28.34133 9.98771 30.01045 5.4024 29.21635.89884l3.15139-.55567z" fill="#FFD15C" fill-rule="evenodd"/></svg>

            </div>
        </div>

    </section>

    <!-- section about -->
    <section id="about">

        <div class="container">

            <!-- section title -->
            <h2 class="section-title wow fadeInUp">About Me</h2>

            <div class="spacer" data-height="60"></div>

            <div class="row">

                <div class="col-md-3">
                    <div class="text-center text-md-left">
                        <!-- avatar image -->
                        <img src="${pageContext.request.contextPath}/resources/resume/images/me.png" alt="" />
                    </div>
                    <div class="spacer d-md-none d-lg-none" data-height="30"></div>
                </div>

                <div class="col-md-9 triangle-left-md triangle-top-sm">
                    <div class="rounded bg-dark shadow-light padding-30">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- about text -->
                                <p><spring:message code="message.mainPage.PR" /></p>
                                <div class="mt-3">
                                    <a href="#" class="btn btn-default">Download Resume</a>
                                </div>
                                <div class="spacer d-md-none d-lg-none" data-height="30"></div>
                            </div>
                            <div class="col-md-6">
                                <!-- skill item -->
                                <div class="skill-item">
                                    <div class="skill-info clearfix">
                                        <h4 class="float-left mb-3 mt-0">Development</h4>
                                        <span class="float-right">85%</span>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar data-background" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="85" data-color="#FFD15C">
                                        </div>
                                    </div>
                                    <div class="spacer" data-height="20"></div>
                                </div>

                                <!-- skill item -->
                                <div class="skill-item">
                                    <div class="skill-info clearfix">
                                        <h4 class="float-left mb-3 mt-0">UI/UX design</h4>
                                        <span class="float-right">95%</span>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar data-background" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="95" data-color="#FF4C60">
                                        </div>
                                    </div>
                                    <div class="spacer" data-height="20"></div>
                                </div>

                                <!-- skill item -->
                                <div class="skill-item">
                                    <div class="skill-info clearfix">
                                        <h4 class="float-left mb-3 mt-0">Photography</h4>
                                        <span class="float-right">70%</span>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar data-background" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="70" data-color="#6C6CE5">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- row end -->

    <!-- section services -->
    <section id="services">
        <div class="container">

            <!-- section title -->
            <h2 class="section-title wow fadeInUp">Skills</h2>
            <div class="spacer" data-height="30"></div>
            <div class="row">
                <div class="service-box rounded data-background padding-30 text-center text-light shadow-blue">
                    <img src="${pageContext.request.contextPath}/resources/img/lang.png" width="1544" height="211"/>
                </div>
                <div class="spacer d-md-none d-lg-none" data-height="30"></div>
            </div>
            <div class="mt-5 text-center">
                <p class="mb-0">Looking for an employee? <a href="#contact">Click here</a> to contact me! 👋</p>
            </div>
        </div>
    </section>

    <!-- section experience -->
    <section id="experience">

        <div class="container">

            <!-- section title -->
            <h2 class="section-title wow fadeInUp">Experience</h2>

            <div class="spacer" data-height="60"></div>

            <div class="row">

                <div class="col-md-6">

                    <!-- timeline wrapper -->
                    <div class="timeline exp bg-dark rounded shadow-light padding-30 overflow-hidden">

                        <!-- timeline item -->
                        <div class="timeline-container wow fadeInUp">
                            <div class="content">
                                <span class="time">2019.04 - 2020.03</span>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.Company" /></h3>
                                <p><spring:message code="message.mainPage.EXP.job" /></p>
                            </div>
                        </div>

                        <!-- main line -->
                        <span class="line"></span>

                    </div>

                </div>

                <div class="col-md-6">

                    <!-- responsive spacer -->
                    <div class="spacer d-md-none d-lg-none" data-height="30"></div>

                    <!-- timeline wrapper -->
                    <div class="timeline exp bg-dark rounded shadow-light padding-30 overflow-hidden">

                        <!-- timeline item -->
                        <div class="timeline-container wow fadeInUp">
                            <div class="content">
                                <span class="time">2020.02 - 2020.03</span>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle" /></h3>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle.2" /></h3>
                                <p><spring:message code="message.mainPage.EXP.title1" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork.res" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork1.1" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork1.2" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork1.3" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork1.4" /></p>
                            </div>
                        </div>

                        <!-- timeline item -->
                        <div class="timeline-container wow fadeInUp" data-wow-delay="0.2s">
                            <div class="content">
                                <span class="time">2019.09 - 2020.02</span>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle" /></h3>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle.2" /></h3>
                                <p><spring:message code="message.mainPage.EXP.title2" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork.res" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork2.1" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork2.2" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork2.3" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork2.4" /></p>
                            </div>
                        </div>

                        <!-- timeline item -->
                        <div class="timeline-container wow fadeInUp" data-wow-delay="0.4s">
                            <div class="content">
                                <span class="time">2019.05 - 2019.07</span>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle" /></h3>
                                <h3 class="title"><spring:message code="message.mainPage.EXP.mainTitle.2" /></h3>
                                <p><spring:message code="message.mainPage.EXP.title3" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork.res" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork3.1" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork3.2" /></p>
                                <p><spring:message code="message.mainPage.EXP.myWork3.3" /></p>
                            </div>
                        </div>

                        <!-- main line -->
                        <span class="line"></span>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <!-- section works -->
    <section id="works">

        <div class="container">

            <!-- section title -->
            <h2 class="section-title wow fadeInUp">Portfolio</h2>

            <div class="spacer" data-height="60"></div>

            <!-- portfolio filter (desktop) -->
            <ul class="portfolio-filter list-inline wow fadeInUp">
                <li class="current list-inline-item" data-filter="*">Everything</li>
                <li class="list-inline-item" data-filter=".creative">SpringFrameWork</li>
                <li class="list-inline-item" data-filter=".art">Document</li>
            </ul>

            <!-- portfolio filter (mobile) -->
            <div class="pf-filter-wrapper">
                <select class="portfolio-filter-mobile">
                    <option value="*">Everything</option>
                    <option value=".creative">SpringFrameWork</option>
                    <option value=".art">Document</option>
                </select>
            </div>

            <!-- portolio wrapper -->
            <div class="row portfolio-wrapper">

                <!-- portfolio item -->
                <div class="col-md-4 col-sm-6 grid-item creative">
                    <a href="#small-dialog" class="work-content">
                        <div class="portfolio-item rounded shadow-dark">
                            <div class="details">
                                <span class="term">SpringFrameWork</span>
                                <h4 class="title">Project Web Market</h4>
                                <span class="more-button"><i class="icon-options"></i></span>
                            </div>
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/resources/img/thubm.png" alt="Portfolio-title" />
                                <div class="mask"></div>
                            </div>
                        </div>
                    </a>
                    <div id="small-dialog" class="white-popup zoom-anim-dialog mfp-hide">
                        <img src="${pageContext.request.contextPath}/resources/img/introdu.png" alt="Title" />
                        <h2>Project Web Market</h2>
                        <p>
                            <spring:message code="message.mainPage.IDE.title" /><br>
                            - IDE : IntelliJ IDEA 2020.3.2<br>
                            - jdk : 1.8.0_181<br>
                            - Springframework : 5.2.3.RELEASE<br>
                            - Tomcat : Apache Tomcat 9.0.38<br>
                            - HTML, Java, JavaScript, JQuery, MySql, Ajax, Kakao Developers(Api), Google Developers(Api), Daum Address(Api) <spring:message code="message.mainPage.IDE.use" />

                        </p>
                        <p>
                            - <spring:message code="message.mainPage.IDE.schedule" /><br>
                            - <spring:message code="message.mainPage.IDE.template" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.1" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.2" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.3" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.4" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.5" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.6" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.7" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.8" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.8.1" /><br>
                            - <spring:message code="message.mainPage.IDE.useSkill.8.2" /><br>
                              <spring:message code="message.mainPage.IDE.useSkill.9" /><br>
                        </p>
                        <a href="${pageContext.request.contextPath}/index" class="btn btn-default"><spring:message code="message.mainPage.Work.Move" /></a>
                        <a href="https://github.com/darkbisop/ProjectWebMarket" class="btn btn-warning">GitHub</a>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 grid-item art">
                    <a href="#small-dialog_2" class="work-content">
                        <div class="portfolio-item rounded shadow-dark">
                            <div class="details">
                                <span class="term">Document</span>
                                <h4 class="title">Unit Test Document</h4>
                                <span class="more-button"><i class="icon-options"></i></span>
                            </div>
                            <div class="thumb">
                                <img src="${pageContext.request.contextPath}/resources/img/UT_thumb.png" alt="Portfolio-title" />
                                <div class="mask"></div>
                            </div>
                        </div>
                    </a>
                    <div id="small-dialog_2" class="white-popup zoom-anim-dialog mfp-hide">
                        <img src="${pageContext.request.contextPath}/resources/img/UTimg.png" alt="Title" />
                        <h2>Unit Test Document</h2>
                        <p>
                            <spring:message code="message.mainPage.IDE.title" /><br>
                            - IDE : Eclipse IDE for Enterprise - 2020-09<br>
                            - jdk : 1.8.0_181<br>
                            - Springframework : 3.1.1.RELEASE<br>
                            - Tomcat : Apache Tomcat 9.0.38<br>
                            - HTML, Java, JavaScript, JQuery, Oracle, Ajax,

                        </p>
                        <p>
                            - <spring:message code="message.mainPage.IDE.schedule" /><br>
                            - <spring:message code="message.mainPage.IDE.Desc" /><br>
                            <spring:message code="message.mainPage.IDE.Desc.2" />
                        </p>
                        <a href="https://drive.google.com/file/d/1PdIvt_MNBjsz9MLN1SkPFeR4Tvdq530s/view?usp=sharing" class="btn btn-default"><spring:message code="message.mainPage.Work.Down" /></a>
                        <a href="https://github.com/darkbisop/SpringBoard" class="btn btn-warning">GitHub</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- section contact -->
    <section id="contact">
        <div class="container">

            <!-- section title -->
            <h2 class="section-title wow fadeInUp">Get In Touch</h2>
            <div class="spacer" data-height="60"></div>
            <div class="row">
                <div class="col-md-4">
                    <!-- contact info -->
                    <div class="contact-info">
                        <h3 class="wow fadeInUp">Let's talk about everything! Send me an <a href="mailto:name@example.com">email</a>. 👋</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="spacer" data-height="96"></div>

    <footer class="footer">
        <div class="container">
            <span class="copyright">© 2020 Bolby Template.</span>
        </div>
    </footer>
        </div>
    </section>
</main>

<!-- Go to top button -->
<a href="javascript:" id="return-to-top"><i class="fas fa-arrow-up"></i></a>

<!-- SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/resume/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/jquery.counterup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/infinite-scroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/contact.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/validator.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/morphext.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/resume/js/custom.js"></script>

</body>
</html>