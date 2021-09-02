class SubsController < ApplicationController
  
  # Controllers are traffic directors, take from routes and lead into actions
  # runs the methods

  # actions CRUD, functions we are able to view or do int he application
  # with each action they will have a method to it. name should match action
  
  #Actions    HTTP verbs
  # Create      Post
  # Read        Get
  # Update      Put/Patch
  # Destroy     Delete

  # logic will be in the model

# actions
# index - show all records in table, take to a page
# show - takes in a id, and show a single record, page/logic to show a single record
# new - pages, new form, to fill out fields for a new object, create in memory
# edit - pages, need id, edit form, to fill out fields that id records returns
# create - apply to the database, create a record in the db, uses info from new form
# update - apply to the db, update the record in the db, uses info from the edit form
# destroy - apply to the db, delete a single record with passed id

  # controller pattern
  # def index 
  #  @model_name = Model.all
  #  render components: 'ModelNames', props: {model_names: @model_names }
  # end 





  
  def index
    @subs = Sub.all 
    render component: 'Subs', props: {subs: @subs}
  end

  def show
    @sub = Sub.find(params[:id])
    render component: 'Sub', props: { sub: @sub }
  end

  def new
    @sub = Sub.new
    render component: 'Sub', props: {sub: @sub }
  end

  def create
    @sub = sub.new (sub_params)
    if @sub.save
      redirect_to subs_path
    else 
      render component: 'SubNew', props: { sub: @sub }
    end
  end  

  def edit
    @sub = Sub.find(params{:id})
    render component: 'SubEdit', props: {sub: @sub}
  end

  def update
    sub = sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else 
      render component: 'SubEdit', props:
      {sub: @sub}
    end
  end 
  
  def destroy
    sub.find(params[:id]).destroy
    @sub.destroy
    redirect_to subs_path

private
    { sub: {name: 'food'}}
    { sub: {name: 'food'}}
  def sub_params
    params.require(:subs).permit(:name)
  end 

end
