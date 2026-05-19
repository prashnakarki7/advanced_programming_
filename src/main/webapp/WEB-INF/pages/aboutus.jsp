<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Executive Team | Nepal Reads</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/aboutus.css">
</head>

<body>

    <jsp:include page="header.jsp" />

    <section class="about-hero">
        <div class="content-wrapper">
            <span class="sub-heading">Corporate Overview</span>

            <h1>
                The Minds Behind
                <span class="highlight">Nepal Reads</span>
            </h1>

            <p>
                Nepal Reads is a premier literary destination established with a singular vision: to make quality 
                literature accessible to every avid reader across Nepal. By combining standard logistical 
                frameworks with an integrated e-commerce user experience, we bridge the gap between global 
                literary publishers, historical masterpieces, independent local writers, and contemporary thinkers. 
                Our team of four dedicated technical and administrative specialists works collectively to manage 
                and scale an archive designed to satisfy the diverse intellectual curiosity of our growing 
                nationwide customer base.
            </p>
        </div>
    </section>

    <section class="team-section">
        <div class="content-wrapper">

            <div class="team-flex-container">

                <a href="portfolios/sujan" class="member-card">

                    <div class="image-area">
                        <div class="avatar-placeholder">PK</div>
                        <div class="view-portfolio">Portfolio</div>
                    </div>

                    <div class="info-area">
                        <h3>Prashna Karki</h3>
                        <span class="designation">CTO</span>
                    </div>

                </a>

                <a href="portfolios/anjali" class="member-card">

                    <div class="image-area">
                        <div class="avatar-placeholder">NR</div>
                        <div class="view-portfolio">Portfolio</div>
                    </div>

                    <div class="info-area">
                        <h3>Nayan Regmi</h3>
                        <span class="designation">Creative Director</span>
                    </div>

                </a>

                <a href="portfolios/bishal" class="member-card">

                    <div class="image-area">
                        <div class="avatar-placeholder">SK</div>
                        <div class="view-portfolio">Portfolio</div>
                    </div>

                    <div class="info-area">
                        <h3>Simon K.C.</h3>
                        <span class="designation">Strategy</span>
                    </div>

                </a>

                <a href="portfolios/pooja" class="member-card">

                    <div class="image-area">
                        <div class="avatar-placeholder">LK</div>
                        <div class="view-portfolio">Portfolio</div>
                    </div>

                    <div class="info-area">
                        <h3>Luza Kawadi</h3>
                        <span class="designation">Operations</span>
                    </div>

                </a>

            </div>

        </div>
    </section>

    <section class="mission">

        <h2>Our Wholesome Mission</h2>

        <p>
            Nepal Reads originally started as a shared academic concept and a simple idea among four close friends. 
            Over time, it evolved into a fully realized mission to cultivate an inclusive community of thinkers, 
            dreamers, and lifelong learners spanning all provinces of our beautiful nation. We believe that access 
            to books changes lives; therefore, our operational goals stretch beyond standard transactional retail. 
            We aim to preserve and promote local Nepali literature, safeguard regional narratives, and empower indigenous 
            authors while providing seamless logistics to transport international bestsellers to your doorstep. Through 
            diligent server administration, modern inventory pipelines, and an unyielding passion for education, 
            we strive to fuel the intellectual development of modern Nepal—one digital order at a time.
        </p>

    </section>

    <jsp:include page="footer.jsp" />

</body>

</html>