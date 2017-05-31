class LepostsController < ApplicationController
    def leposts_index
        @lepost= Lepost.new
    end
    #교양 그룹
    def lederand
        @lpost= Lpost.where(lepost_id: 1)
    end
    #LederShip Community Service 약자 lcs
    
    def lcs
        @lpost=Lpost.where(lepost_id: 2)
    end
    
    #수정, 삭제, 삽입 그룹
    def new
        @lepost= Lepost.find(params[:lepost_id])
        #new가 데이터베이스에서 해당 아이디를 찾아야하는이유는
        #create 게시글을 생성할때 lepost의 id와 bbs_name을 넘겨줘야하기때문에
        #lepost즉 게시판에서 lepost의 id번호를 url로 넘겨주면 
        #new에서는 넘겨받은 id번호를 lepost테이블에서 찾아 해당 레코드를
        #lepost에 저장하고 뷰에서 create로 넘길때 
        #lepost의 아이디와 bbs_name을 넘겨준다. 
        
        #게시글 생성할 거라능
    end
    
    def create
        @lpost=Lpost.new
        @lpost.title = params[:title]
        @lpost.content =params[:content]
        @lpost.lepost_id = params[:lepost_id]
        @lpost.save
        
        redirect_to "/leposts/#{params[:lepost_name]}"
        #new에서 url로 lepost의 bbs_name과, id를 넘겨받고
        #해당 lepost_id에는 넘겨받은 id를 넣고 다시 돌아갈 곳을 보여주는 곳으로 보내야하니
        #bbs_name 즉 lepost_name을 활용해 해당 게시판으로 돌아간다.
    end
end
