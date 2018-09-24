class Article < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {
    minimum: 1, too_short: '1文字以上入力してください',
    maximum: 140, too_long: '最大140文字まで入力できます'
  }
end
