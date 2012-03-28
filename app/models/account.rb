# class Account
#   include DataMapper::Resource

#   property :id,         Serial 
#   property :identifier,      String 
#   property :name,      String   
#   property :created_at, DateTime
  
#   has n, :users
#   has n, :products
#   has n, :suppliers
#   has n, :purchases
  
#   def self.create_and_save properties
#     account = Account.create :name => properties['name'],
#                              :identifier => properties['identifier']

#     user = User.create_and_save(account, properties)

#     account
#   end
# end
