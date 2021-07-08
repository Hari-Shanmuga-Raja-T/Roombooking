class WishlistsController<ApplicationController
    def create
        wishlist=Wishlist.new
        wishlist.room_id=params[:room_id]
        wishlist.user_id=params[:user_id]
        respond_to do |format|
            if wishlist.save
              format.html { redirect_to users_userhome_path, notice: "Added to wishlist" }
            else
              format.html { redirect_to users_userhome_path, notice: "Failed"}
            end
        end
    end
    def delete
        wishlist=Wishlist.find_by(room_id:params[:room_id])
        respond_to do |format|
            if wishlist.destroy
              format.html { redirect_to users_userhome_path, notice: "Removed" }
            else
              format.html { redirect_to users_userhome_path, notice: "Failed"}
            end
        end
    end
end