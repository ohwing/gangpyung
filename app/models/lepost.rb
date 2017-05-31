#게시판 분류 모델 1역할 
class Lepost < ActiveRecord::Base
    has_many :Lposts
end
