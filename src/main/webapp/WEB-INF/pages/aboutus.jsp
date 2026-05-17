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

    <!-- Hero Section -->
    <section class="about-hero">
        <div class="content-wrapper">
            <span class="sub-heading">Corporate Overview</span>

            <h1>
                The Minds Behind
                <span class="highlight">Nepal Reads</span>
            </h1>

            <p>
                A specialized team of four experts redefining the literary
                landscape of Nepal.
            </p>
        </div>
    </section>

    <!-- Executive Team Section -->
    <section class="team-section">
        <div class="content-wrapper">

            <div class="team-flex-container">

                <!-- Member 1 -->
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

                <!-- Member 2 -->
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

                <!-- Member 3 -->
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

                <!-- Member 4 -->
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

    <!-- Mission Section -->
    <section class="mission">

        <h2>Our Wholesome Mission</h2>

        <p>
            Nepal Reads started as a simple idea among four friends.
            Our goal isn't just to sell books, but to foster a community
            of thinkers, dreamers, and lifelong learners across our
            beautiful nation.
        </p>

    </section>

    <jsp:include page="footer.jsp" />

</body>

</html>