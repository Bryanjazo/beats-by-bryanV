module ReviewHelper

    def rating_star(rating)
        star = ""
        rating.times do
            star << "<span class='glyphicon glyphicon-star'></span>"
        end
        star.html_safe
    end

    def blank_star(rating)
        blank = 10 - rating
        blank_star = ""
        blank.times do
            blank_star << "<span class='glyphicon glyphicon-star-empty'></span>"
        end
        blank_star.html_safe
    end

    def review_created(review)
        review.created_at.strftime("Review created at %A, %d %b %Y %l:%M %p")
    end

end
