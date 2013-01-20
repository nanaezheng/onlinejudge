class ProblemsController < ApplicationController
  include ApplicationHelper

  before_filter :authenticate_user!, :only => [:submit]
  before_filter :require_authorized_key, :only => [:create, :update]

  # GET /problems
  # GET /problems.json
  def index
    @problems = initialize_grid(Problem)

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        ret = Hash.new
        Problem.select([:id, :code]).each do |problem|
          ret[problem.code] = problem.id
        end
        render :json => ret
      end
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find_by_id(params[:id])
    if @problem.nil? 
      redirect_to :problems, 
                  :flash => { :error => "No such problem." }
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @problem }
      end
    end
  end

  def create
    @problem = Problem.new
    if @problem.build_from_json!(params[:data])
      respond_to do |format|
        format.json { render :json => @problem }
      end
    end
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.build_from_json!(params[:data])
      respond_to do |format|
        format.json { render :json => @problem }
      end
    end
  end

  def submit
    @problem = Problem.find_by_id(params[:id])

    if @problem.nil? 
      redirect_to :problems, 
                  :flash => { :error => "No such problem." }
    else
      @submission = Submission.new(:user => current_user, 
                                   :problem => @problem)
      respond_to do |format|
        format.html 
      end
    end
  end
end
