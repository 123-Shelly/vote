class CandidatesController < ApplicationController

	# before_action : find_candidate, only: [:show, :edit, :update, :destroy, :vote] 
	# 直接寫在上面，下面都不用寫了，加 only指定。或 except: [:new, :creat, :index] 除了。

	def index
		@candidates = Candidate.all
	end

	def show
		# params[:id]
		find_candidate
	end


  def new
  	@candidate = Candidate.new
	end
  

  def create 
  	# clean_params = params.require(:candidate).permit(:name, :party, :age, :politics)

  	@candidate = Candidate.new(candidate_params)
  	
  	if @candidate.save
  		 # flash[:notice] = "已建立!"
  		 redirect_to '/candidates', notice: '已建立!'
  	else
  		 render :new
  		 # redirect_to '/index/new'
  	end
  	# debugger
	end


	def edit
		find_candidate
	end


	def update
		find_candidate

		if @candidate.update(candidate_params)
			# flash[:notice] = "已更新!"
  		redirect_to '/candidates', notice: '已更新!'
		else
			render :edit
		end
	end

	def destroy
		find_candidate
		@candidate.destroy
		# flash[:notice] = "已刪除!"
  	redirect_to '/candidates', notice: '已刪除!'
	end
  

  def vote
  	find_candidate

  	# v = VoteLog.new(candidate: @candidate, ip_address: request.remote_ip )
   #  v.save

    @candidate.vote_logs.create(ip_address: request.remote_ip)

  	# @candidate.votes = @candidate.votes + 1
  	# @candidate.increment(:votes)
  	# @candidate.save
  	flash[:notice] = "投票完成!"
  	redirect_to '/candidates'
  end




  private
	def candidate_params
		params.require(:candidate).permit(:name, :party, :age, :poltics)
  end


  def find_candidate
  	@candidate = Candidate.find_by(id: params[:id]) 	
  end



end