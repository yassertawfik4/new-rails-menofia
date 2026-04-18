class PostEditorsController < ApplicationController
  before_action :set_post_editor, only: %i[ show edit update destroy ]

  # GET /post_editors or /post_editors.json
  def index
    @post_editors = PostEditor.all
  end

  # GET /post_editors/1 or /post_editors/1.json
  def show
  end

  # GET /post_editors/new
  def new
    @post_editor = PostEditor.new
  end

  # GET /post_editors/1/edit
  def edit
  end

  # POST /post_editors or /post_editors.json
  def create
    @post_editor = PostEditor.new(post_editor_params)

    respond_to do |format|
      if @post_editor.save
        format.html { redirect_to @post_editor, notice: "Post editor was successfully created." }
        format.json { render :show, status: :created, location: @post_editor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_editors/1 or /post_editors/1.json
  def update
    respond_to do |format|
      if @post_editor.update(post_editor_params)
        format.html { redirect_to @post_editor, notice: "Post editor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @post_editor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_editor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_editors/1 or /post_editors/1.json
  def destroy
    @post_editor.destroy!

    respond_to do |format|
      format.html { redirect_to post_editors_path, notice: "Post editor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_editor
      @post_editor = PostEditor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_editor_params
      params.expect(post_editor: [ :post_id, :editor_id ])
    end
end
