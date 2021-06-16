class Log < ApplicationRecord
  belongs_to :hotel , optional: true
  belongs_to :user  , optional: true
end
