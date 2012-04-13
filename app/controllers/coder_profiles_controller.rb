class CoderProfilesController < ApplicationController
  # GET /coder_profiles
  # GET /coder_profiles.json
  def index
    @coder_profiles = CoderProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coder_profiles }
    end
  end

  # GET /coder_profiles/1
  # GET /coder_profiles/1.json
  def show
    @coder_profile = CoderProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coder_profile }
    end
  end

  # GET /coder_profiles/new
  # GET /coder_profiles/new.json
  def new
    @coder_profile = CoderProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coder_profile }
    end
  end

  # GET /coder_profiles/1/edit
  def edit
    if current_user.id==params[:id].to_i && current_user.coder_profile.present?
       @coder_profile = CoderProfile.find(params[:id])
      else
        redirect_to users_path, :flash=>{:error=>"Naughty naughty"}
      end
    
  end

  # POST /coder_profiles
  # POST /coder_profiles.json
  def create
    @coder_profile = CoderProfile.new(params[:coder_profile])
    @coder_profile.user_id = current_user.id

    respond_to do |format|
      if @coder_profile.save
        format.html { redirect_to users_path, notice: 'Coder profile was successfully created.' }
        format.json { render json: @coder_profile, status: :created, location: @coder_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @coder_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coder_profiles/1
  # PUT /coder_profiles/1.json
  def update
    @coder_profile = CoderProfile.find(params[:id])

    respond_to do |format|
      if @coder_profile.update_attributes(params[:coder_profile])
        format.html { redirect_to @coder_profile, notice: 'Coder profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @coder_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coder_profiles/1
  # DELETE /coder_profiles/1.json
  def destroy
    @coder_profile = CoderProfile.find(params[:id])
    @coder_profile.destroy

    respond_to do |format|
      format.html { redirect_to coder_profiles_url }
      format.json { head :ok }
    end
  end
end
