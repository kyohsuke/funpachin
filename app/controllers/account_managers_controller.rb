class AccountManagersController < AdminController
  # GET /account_managers
  # GET /account_managers.json
  def index
    @account_managers = AccountManager.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /account_managers/1
  # GET /account_managers/1.json
  def show
    @account_manager = AccountManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /account_managers/new
  # GET /account_managers/new.json
  def new
    @account_manager = AccountManager.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /account_managers/1/edit
  def edit
    @account_manager = AccountManager.find(params[:id])
  end

  # POST /account_managers
  # POST /account_managers.json
  def create
    @account_manager = AccountManager.new(params[:account_manager])

    respond_to do |format|
      if @account_manager.save
        format.html { redirect_to @account_manager, notice: 'Account manager was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /account_managers/1
  # PUT /account_managers/1.json
  def update
    @account_manager = AccountManager.find(params[:id])

    respond_to do |format|
      if @account_manager.update_attributes(params[:account_manager])
        format.html { redirect_to @account_manager, notice: 'Account manager was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /account_managers/1
  # DELETE /account_managers/1.json
  def destroy
    @account_manager = AccountManager.find(params[:id])
    @account_manager.destroy

    respond_to do |format|
      format.html { redirect_to account_managers_url }
    end
  end
end
