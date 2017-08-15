namespace :utils do
  desc "Popular banco de dados."
  task seed: :environment do
    puts "Criando os contatos(Contatos)..."
      100.times do |i|
            Contact.create!(
                        name: Faker::Name.name,
                        email: Faker::Internet.email,
                        kind: Kind.all.sample,
                        rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
                        )
      end
      puts "Gerando os tipos de contato.. [ok]"
      
      puts "Criacao dos endereços..."
      Contact.all.each do |contact|
            Adress.create!([
                        street: Faker::Address.street_address,
                        city: Faker::Address.city,
                        state: Faker::Address.state_abbr,
                        contact: contact
                        ])
      end
      puts "Criacao dos endereços....[ok]"

      puts "Criação dos telefones..."
           Contact.all.each do |contact|
                  Random.rand(1..5).times do |i|
                        Phone.create!([
                                 phone: Faker::PhoneNumber.phone_number,
                                 contact: contact
                        ])
                  end
            end
      puts "Criação dos telefones...[ok]"
  end

end
