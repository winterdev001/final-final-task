class CommentsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @comment = @company.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js {render :index}
      else
        format.html {redirect_to (:back),notice:'Commenting failed....'}
      end
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @comment = Comment.find(params[:id])

  end

  def update 
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment].permit(:content))
      if current_company
        redirect_to companies_path
      else
        redirect_to workers_path
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @company = @comment.company
    @comment.destroy    
    flash[:success] = 'Comment deleted.'
    if current_company
      redirect_to company_path
    else
      redirect_to workers_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:company_id, :content, :worker_id)
  end
end
