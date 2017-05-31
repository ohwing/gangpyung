class Lpost < ActiveRecord::Base
    #게시글이 작성될 모델 N역할
    belongs_to :Lepost
end
