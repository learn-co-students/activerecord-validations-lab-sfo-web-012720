class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 20}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top [number]/i,
        /Guess/i
    ]

    def is_clickbait?
        if CLICKBAIT.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end
end
