class Category < ApplicationRecord
  has_and_belongs_to_many :products

  def children
    Category.where(category_id: self.id)
  end

  def family
    family = []
    childrens = self.children
    childrens.each do |c|
      family.push c
      x = c.children
      if x.count > 0
        family.push x
      end
    end
    family
  end

  def offspring(offsprings = nil)
    offsprings ||= []
    # ||= crea el arreglo en caso de ser vacio
    childrens = Category.where(category_id: self.id)
    childrens.each do |child|
      offsprings << {id: child.id , name: child.name}
      child.offspring(offsprings)
    end
    offsprings
  end 


end



# categoria
  #Electrodomesticos
    #plancha
      #vapor
       #sindelen
       #oster
      #normal
    #horno
      # Electrico
      # solar
    #refrigrador
      # 2 puertas
      # Congelador