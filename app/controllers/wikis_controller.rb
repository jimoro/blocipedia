class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  def index
    @wikis = policy_scope(Wiki)
  end

  # GET /wikis/1
  def show
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    @collaborating_users = @wiki.users
    @users = User.all - @collaborating_users
  end

  # POST /wikis
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user  # Associate 'user_id' with the user creating the wiki

    if @wiki.save
      redirect_to @wiki, notice: 'Wiki was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wikis/1
  def update
    @wiki = Wiki.find(params[:id])   # See https://github.com/elabs/pundit
    authorize @wiki   # See https://github.com/elabs/pundit
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: 'Wiki was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wikis/1
  def destroy
    redirect_to wikis_url, notice: 'Wiki was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end
