class SubmissionsController < ApplicationController
  include ApplicationHelper

  before_filter :require_authorized_key, :only => [:update]

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = initialize_grid(Submission, 
                                   :order => 'submissions.id',
                                   :order_direction => 'desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render :json => Submission.where(:status => 0).select(:id) 
      end
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end


  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(params[:submission])

    respond_to do |format|
      if @submission.save
        format.html { redirect_to :submissions, notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.build_from_json!(params[:data])
      respond_to do |format|
        format.json { render :json => @submission }
      end
    end
  end
end
