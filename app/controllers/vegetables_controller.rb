class VegetablesController < ApplicationController
  def index
    @vegetables = Vegetable.all 
    sort_attribute = params[:sort]
    if sort_attribute
      @vegetables = Vegetable.order(sort_attribute)
    end

    sort_descending = params[:descend]
    if sort_descending
      @vegetables = Vegetable.order(sort_descending => :desc) 
    end

    less_than_two = params[:discount]
    if less_than_two
      @vegetables = Vegetable.where("#{less_than_two} < ?", 2)
    end

    if params[:category]
      @vegetables = Category.find_by(name: params[:category]).vegetables     
    end
        
    render 'index.html.erb'
  end

  def show
    vegetable_id = params[:id]

    if vegetable_id == "random"
      vegetables = Vegetable.all
      @vegetable = vegetables.sample
    else
      @vegetable = Vegetable.find_by(id: vegetable_id)
    end
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    Vegetable.create(name: params[:name], image: params[:image], price: params[:price], description: params[:description], health_benefits: params[:health_benefits], user_id: current_user.id)
    vegetable = Vegetable.last
    flash[:success] = "Vegetable successfully created!"
    redirect_to "/vegetables/#{vegetable.id}"
  end

  def edit
    vegetable_id = params[:id]
    @vegetable = Vegetable.find_by(id: vegetable_id)
    render 'edit.html.erb'
  end

  def update
    vegetable_id = params[:id]
    @vegetable = Vegetable.find_by(id: vegetable_id)
    @vegetable.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description], health_benefits: params[:health_benefits])
    flash[:success] = "Vegetable successfully updated!"
    redirect_to "/vegetables/#{@vegetable.id}"
  end

  def destroy
    vegetable_id = params[:id]
    @vegetable = Vegetable.find_by(id: vegetable_id)
    @vegetable.destroy
    flash[:success] = "Vegetable successfully deleted!"
    redirect_to "/vegetables"
  end

  def run_search
    search_term = params[:search]
    @vegetables = Vegetable.where("name LIKE ?", "%" + search_term + "%")
    render "index.html.erb"  
  end
end
