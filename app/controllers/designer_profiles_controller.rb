class DesignerProfilesController < ApplicationController
  # GET /designer_profiles
  # GET /designer_profiles.json
  def index
    @designer_profiles = DesignerProfile.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @designer_profiles }
    end
  end

  # GET /designer_profiles/1
  # GET /designer_profiles/1.json
  def show
    @designer_profile = DesignerProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @designer_profile }
    end
  end

  # GET /designer_profiles/new
  # GET /designer_profiles/new.json
  def new
    @designer_profile = DesignerProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @designer_profile }
    end
  end

  # GET /designer_profiles/1/edit
  def edit
    @designer_profile = DesignerProfile.find(params[:id])
  end

  # POST /designer_profiles
  # POST /designer_profiles.json
  def create
    @designer_profile = DesignerProfile.new(params[:designer_profile])
    @designer_profile.user_id = current_user.id

    respond_to do |format|
      if @designer_profile.save
        format.html { redirect_to users_path, notice: 'Designer profile was successfully created.' }
        format.json { render json: @designer_profile, status: :created, location: @designer_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @designer_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /designer_profiles/1
  # PUT /designer_profiles/1.json
  def update
    @designer_profile = DesignerProfile.find(params[:id])

    respond_to do |format|
      if @designer_profile.update_attributes(params[:designer_profile])
        format.html { redirect_to @designer_profile, notice: 'Designer profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @designer_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designer_profiles/1
  # DELETE /designer_profiles/1.json
  def destroy
    @designer_profile = DesignerProfile.find(params[:id])
    @designer_profile.destroy

    respond_to do |format|
      format.html { redirect_to designer_profiles_url }
      format.json { head :ok }
    end
  end
end
