class EmailHistoriesController < ApplicationController
  # GET /email_histories
  # GET /email_histories.json
  def index
    @email_histories = EmailHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_histories }
    end
  end

  # GET /email_histories/1
  # GET /email_histories/1.json
  def show
    @email_history = EmailHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_history }
    end
  end

  # GET /email_histories/new
  # GET /email_histories/new.json
  def new
    @email_history = EmailHistory.new
    @lead = Lead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_history }
    end
  end

  # GET /email_histories/1/edit
  def edit
    @email_history = EmailHistory.find(params[:id])
    @lead = @email_history.lead
  end

  # POST /email_histories
  # POST /email_histories.json
  def create
    @email_history = EmailHistory.new(params[:email_history])
    @lead = Lead.new(params[:lead])
    @email_history.lead = @lead

    respond_to do |format|
      if @lead.valid? && @email_history.valid?
        LeadMailer.email(@email_history).deliver
        @lead.save
        @email_history.save
        format.html { redirect_to new_email_history_path, notice: 'Email history was successfully created.' }
        format.json { render json: @email_history, status: :created, location: @email_history }
      else
        format.html { render action: "new" }
        format.json { render json: [@email_history.errors, @lead.errors], status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_histories/1
  # PUT /email_histories/1.json
  def update
    @email_history = EmailHistory.find(params[:id])

    respond_to do |format|
      if @email_history.update_attributes(params[:email_history])
        format.html { redirect_to @email_history, notice: 'Email history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_histories/1
  # DELETE /email_histories/1.json
  def destroy
    @email_history = EmailHistory.find(params[:id])
    @email_history.destroy

    respond_to do |format|
      format.html { redirect_to email_histories_url }
      format.json { head :no_content }
    end
  end
end
