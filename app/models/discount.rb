class Discount < ApplicationRecord

    validates :percentage, numericality: { only_integer: true }

    belongs_to :hotel

    def self.import(file,id)
        CSV.foreach(file.path, headers: true) do |row|
            discount = Discount.find_by(hotel_id: id)
            discount.update(row.to_hash)
        end
    end
    
end