json.user do
    json.set! @user.id do
        json.extract! @user, :id, :first_name
    end
end

if @user.prof_reviews.length != 0
    json.prof_reviews do
        @user.prof_reviews.each do |prof_review|
            json.set! prof_review.id do
                json.extract! prof_review, :id, :body, :quality, :difficulty, :klass, :grade, :tag1, :tag2, :tag3, :take_again, :for_credit, :txt_book, :attendance, :author_id, :prof_id
                json.updatedOn prof_review.updated_at.strftime("%a, %d %b %Y")
            end
        end
    end
else
    json.prof_reviews ({})
end