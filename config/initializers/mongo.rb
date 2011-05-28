# Local ###
# MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
# MongoMapper.database = "ts-#{Rails.env}"

MongoMapper.database = 'ForeCashed'
# Mongo HQ ###
MongoMapper.connection = Mongo::Connection.new('flame.mongohq.com', 27106)
MongoMapper.database.authenticate('use_forecashed', 'osHilAzJoo')

# Shared Drive ###
# MongoMapper.connection = Mongo::Connection.new('192.168.0.100', 27017)


if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end
