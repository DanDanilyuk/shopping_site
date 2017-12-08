class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word,
                      price: rand(10...100),
                      description: Faker::Lorem.sentence(5, false, 0).chop,
                      image: URI.parse(Faker::LoremPixel.image("600x600")))
    p "Created #{Product.count} products"
    end
  end
end

Seed.begin
