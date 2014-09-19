class AdminController < ApplicationController

  before_filter except: ["login", "login_post", "logout"] do
    if session[:admin_id] != nil
      @admin = Admin.where(id: session[:admin_id]).first
    else
      flash[:error] = "You must be logged in to see that page."
      session[:attempted_path] = request.path_info
      redirect_to "/admin/login" and return
    end
  end

  def login
    render :login and return
  end

  def login_post
    username = params[:username]
    password = params[:password]
    admin    = Admin.where(username: username).first

    if admin == nil
      flash.now[:error] = "Unknown username"
      render :login and return
    elsif admin.authenticate(password) == false
      flash.now[:error] = "Wrong password"
      render :login and return
    else 
      session[:admin_id] = admin.id

      attempted_path = session[:attempted_path]
      if attempted_path != nil
        session[:attempted_path] = nil
        redirect_to attempted_path and return
      else
        redirect_to "/admin/appraisalfees" and return
      end
    end
  end

  def index
    @appraisal_fee = Appraisal_fee.order(:id)
    render :index and return
  end

  def index_post
    Appraisal_fee.all.each do |appraisal_fee|
      if params[:commit] == "Delete appraisal_fee #{appraisal_fee.id}"
        appraisal_fee.destroy
      end
    end
    redirect_to "/admin/appraisalfees" and return
  end

  def edit
    @appraisal_fee = Appraisal_fee.where(id: params[:id]).first
    render :edit and return
  end

  def edit_post
    @appraisalfee                 = Appraisal_fee.where(id: params[:id]).first
    @appraisalfee.description     = params[:description]
    @appraisalfee.fee             = params[:fee]
 if @appraisalfee.save
      redirect_to "/admin/appraisalfees" and return
    else
      render :edit and return
    end
  end

  def new
    @appraisal_fee = Appraisal_fee.new
    render :new and return
  end

  def new_post
    @appraisalfee                  = Appraisal_fee.new
    @appraisalfee.description      = params[:description]
    @appraisalfee.fee              = params[:fee]

    if @appraisalfee.save
      redirect_to "/admin/appraisalfees" and return
    else
      render :new and return
    end
  end

  def logout
    session.clear
    redirect_to "/admin/login" and return
  end

end
