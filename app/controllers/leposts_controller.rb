class LepostsController < ApplicationController
    require 'will_paginate'
    def leposts_index
        @lepost= Lepost.new
    end
    
    #교양 그룹##########################################
    def lederand
        @lpost= Lpost.where(lepost_id: 1).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end
    #LederShip Community Service 약자 lcs
    
    def lcs
        @lpost=Lpost.where(lepost_id: 2)
    end
    ####################################################
    
    #수정, 삭제, 삽입 그룹#######################################################
    def new
        @lepost= Lepost.find(params[:lepost_id])
        #new가 데이터베이스에서 해당 아이디를 찾아야하는이유는
        #create 게시글을 생성할때 lepost의 id와 bbs_name을 넘겨줘야하기때문에
        #lepost즉 게시판에서 lepost의 id번호를 url로 넘겨주면 
        #new에서는 넘겨받은 id번호를 lepost테이블에서 찾아 해당 레코드를
        #lepost에 저장하고 뷰에서 create로 넘길때 
        #lepost의 아이디와 bbs_name을 넘겨준다. 
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
    
    def show
        @lpost=Lpost.find(params[:lpost_id])
        @lepost=Lepost.find(params[:lepost_id])
        @comment = Lcomment.where(lpost_id: params[:lpost_id])
        #게시글의 아이디를 받아야한다. lpost.id
    end
    
    def edit
        @lpost= Lpost.find(params[:lpost_id]) #new와 마찬가지로 수정해야할 레코드를 알아야 하기때문에 받아준다.
    end
    
    def updateda
        @lpost=Lpost.find(params[:lpost_id])
        @lpost.title = params[:title]
        @lpost.content =params[:content]
        @lpost.lepost_id = params[:lepost_id]
        @lpost.save
        
        @lepost=Lepost.find(params[:lepost_id])
        
        redirect_to "/leposts/#{@lepost.bbs_name}"
    end
    def destroy
        @lpost=Lpost.find(params[:lpost_id])
        @lpost.destroy
        
        @lepost=Lepost.find(params[:lepost_id])
        redirect_to "/leposts/#{@lepost.bbs_name}"
    end
    #########################################################################################
end
