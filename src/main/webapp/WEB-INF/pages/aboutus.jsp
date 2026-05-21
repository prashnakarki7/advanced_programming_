<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Executive Team | Nepal Reads</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
</head>

<body>

    <jsp:include page="header.jsp" />

    <section class="about-hero">
        <div class="content-wrapper">
            <span class="sub-heading">Corporate Overview</span>
            <h1>The Minds Behind <span class="highlight">Nepal Reads</span></h1>
            <p>
                Nepal Reads is a premier literary destination established with a singular vision: to make quality 
                literature accessible to every avid reader across Nepal. Our team of four dedicated technical 
                and administrative specialists works collectively to manage and scale an archive designed to satisfy 
                the diverse intellectual curiosity of our growing nationwide customer base.
            </p>
        </div>
    </section>

    <section class="team-section">
        <div class="content-wrapper">
            <div class="team-flex-container">

                <div class="member-card">
                    <div class="image-area">
                        <img src="${pageContext.request.contextPath}/images/books/prashna.jpeg" 
                             class="member-img" 
                             alt="Prashna Karki"
                             onerror="this.src='https://via.placeholder.com/300x300?text=Prashna+Karki'">
                    </div>
                    <div class="info-area">
                        <h3>Prashna Karki</h3>
                        <span class="designation">CTO</span>
                    </div>
                </div>

                <div class="member-card">
                    <div class="image-area">
                        <img src="${pageContext.request.contextPath}/images/books/Nayan.jpeg" 
                             class="member-img" 
                             alt="Nayan Regmi"
                             onerror="this.src='https://via.placeholder.com/300x300?text=Nayan+Regmi'">
                    </div>
                    <div class="info-area">
                        <h3>Nayan Regmi</h3>
                        <span class="designation">Creative Director</span>
                    </div>
                </div>

                <div class="member-card">
                    <div class="image-area">
                        <img src="${pageContext.request.contextPath}/images/books/simon.jpeg" 
                             class="member-img" 
                             alt="Simon K.C."
                             onerror="this.src='https://via.placeholder.com/300x300?text=Simon+K.C.'">
                    </div>
                    <div class="info-area">
                        <h3>Simon K.C.</h3>
                        <span class="designation">Strategy</span>
                    </div>
                </div>

                <div class="member-card">
                    <div class="image-area">
                        <img src="${pageContext.request.contextPath}/images/books/luja.jpeg" 
                             class="member-img" 
                             alt="Luza Kawadi"
                             onerror="this.src='https://via.placeholder.com/300x300?text=Luza+Kawadi'">
                    </div>
                    <div class="info-area">
                        <h3>Luza Kawadi</h3>
                        <span class="designation">Operations</span>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="mission">
        <h2>Our Wholesome Mission</h2>
        <p>
            Nepal Reads originally started as a shared academic concept and a simple idea among four close friends. 
            Over time, it evolved into a fully realized mission to cultivate an inclusive community of thinkers, 
            dreamers, and lifelong learners spanning all provinces of our beautiful nation.
        </p>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>