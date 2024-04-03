class PersonnelsController < ApplicationController

skip_before_action :verify_authenticity_token, only: [ :item_create, :personnel_create]


	def personnel_index
		@personnels = Personnel.all
	end

	def personnel_new
	end

	def personnel_create
		personnel = Personnel.new
		personnel.name = params[:name]
		personnel.email = params[:email]
		personnel.password = params[:password]
		personnel.password_digest = params[:password_digest]
		personnel.save

		flash[:success] = "Personnel Created Successfully."
		redirect_to personnels_personnel_index_url
	end

	def personnel_edit
		@personnel = Personnel.find(params[:format])
	end

	def personnel_update
		personnel = Personnel.find(params[:personnel_id])
		personnel.update(name: params[:name],email: params[:email])
		flash[:success] = "Personnel Update Successfully."
		redirect_to personnels_personnel_index_url
	end
	def personnel_destroy 
		@personnel = Personnel.find(params[:format])
		@personnel.destroy

		flash[:success] = "Personnel Destroy Successfully."
		redirect_to personnels_personnel_index_url
	end

	def item_index
		@items = Item.all
	end

	def item_new
	end

	def item_create
		item = Item.new
		item.name = params[:name]
		item.save

		flash[:success] = "Item Created Successfully."
		redirect_to personnels_item_index_url
	end

	def item_edit
		@item = Item.find(params[:format])
	end

	def item_update
		item = Item.find(params[:item_id])
		item.update(name: params[:name])

		flash[:success] = "Item update Successfully"
		redirect_to personnels_item_index_url
	end

	def item_destroy
		@item = Item.find(params[:format])
		@item.destroy

		flash[:success] = "Item Delete Successfully"
		redirect_to personnels_item_index_url
	end






	private
    def set_personnel
      @personnel = Personnel.find(params[:id])
    end

   def personnel_params
      params.require(:personnel).permit(:email, :name, :auth_token, :password, :password_confirmation)
    end
end
