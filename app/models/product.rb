

class Product < ActiveRecord::Base
    validates :active, presence: true


    # FIXME: SOMETHING
    def released_on
        released_at.to_date rescue Date.today
        puts "something"
        
    end
    


    # TODO: Improve this logic

    def self.build_product(p)
        if p.empty?
            self.new({title: "empty product", price: 0})
        else
            Product.new(p)
        end
    end
end
