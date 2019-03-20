class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :must_be_clickbait

  def must_be_clickbait
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    if title && !clickbait_words.any? {|word| title.include?(word)}
      errors[:title] << "Must be clickbait"
    end
  end
end
