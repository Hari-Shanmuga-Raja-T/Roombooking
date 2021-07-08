class DiscountsController<ApplicationController
    def edit
        status=false
        discount=Discount.find_by(hotel_id:current_hotel.id)
        if discount.nil?
            discount=Discount.new
            discount.description=params[:description]
            discount.percentage=params[:percentage].to_i
            discount.hotel_id=current_hotel.id
            status=discount.save
        else
            status=discount.update(description:params[:description],percentage:params[:percentage].to_i)
        end
        respond_to do |format|
            if status
                format.html { redirect_to hotel_discount_path , notice: "Successfully added"}
            else
                format.html { redirect_to hotel_discount_path , notice: "Adding was unsuccessful"}
            end
        end
    end
end