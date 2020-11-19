document.addEventListener("DOMContentLoaded", function() {
    var lazyloadImages;

    if ("IntersectionObserver" in window) {
        lazyloadImages = document.querySelectorAll(".img-responsive");
        var imageObserver = new IntersectionObserver(function(entries, observer) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    var image = entry.target;
                    image.src = image.dataset.src;
                    imageObserver.unobserve(image);
                    var $grid = $('.grid').masonry({
                        // options...
                    });
                    // layout Masonry after each image loads
                    $grid.imagesLoaded().progress( function() {
                        $grid.masonry('layout');
                    });
                }
            });
        });

        lazyloadImages.forEach(function(image) {
            imageObserver.observe(image);
        });
    } else {
        var lazyloadThrottleTimeout;
        lazyloadImages = document.querySelectorAll(".img-responsive");

        function lazyload () {
            if(lazyloadThrottleTimeout) {
                clearTimeout(lazyloadThrottleTimeout);
            }

            lazyloadThrottleTimeout = setTimeout(function() {
                var scrollTop = window.pageYOffset;
                lazyloadImages.forEach(function(img) {
                    if(img.offsetTop < (window.innerHeight + scrollTop)) {
                        img.src = img.dataset.src;
                        var $grid = $('.grid').masonry({
                            // options...
                        });
                        // layout Masonry after each image loads
                        $grid.imagesLoaded().progress( function() {
                            $grid.masonry('layout');
                        });
                    }
                });
                if(lazyloadImages.length == 0) {
                    document.removeEventListener("scroll", lazyload);
                    window.removeEventListener("resize", lazyload);
                    window.removeEventListener("orientationChange", lazyload);
                    var $grid = $('.grid').masonry({
                        // options...
                    });
                    // layout Masonry after each image loads
                    $grid.imagesLoaded().progress( function() {
                        $grid.masonry('layout');
                    });
                }
            }, 20);
        }

        document.addEventListener("scroll", lazyload);
        window.addEventListener("resize", lazyload);
        window.addEventListener("orientationChange", lazyload);
    }
})
