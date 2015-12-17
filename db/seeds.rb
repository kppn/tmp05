# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Owner.destroy_all
Car.destroy_all
ActiveRecord::Base.connection.execute %q|UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='users'|;
ActiveRecord::Base.connection.execute %q|UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='owners'|;
ActiveRecord::Base.connection.execute %q|UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='cars'|;


o1 = Owner.create :name => 'takashi'
o2 = Owner.create :name => 'nanasi'
o3 = Owner.create :name => 'ta_kondoh'


User.create \
  :name                  => 'admin',
  :email                 => 'ta_kondoh@actis.co.jp',
  :sign_in_count         => 0,
  :password              => 'admin123',
  :password_confirmation => 'admin123'

User.create \
  :name                  => 'ta_kondoh',
  :email                 => 'ta_kondoh2@actis.co.jp',
  :sign_in_count         => 0,
  :password              => 'Kppnn3',
  :password_confirmation => 'Kppnn3',
  :owner_id              => o3.id

Car.create :name => 'toyota',  :owner_id => o1.id
Car.create :name => 'nissan',  :owner_id => o1.id
Car.create :name => 'honda',   :owner_id => o1.id
Car.create :name => 'hino',    :owner_id => o2.id
Car.create :name => 'daihatu', :owner_id => o2.id
Car.create :name => 'suzuki',  :owner_id => o2.id
Car.create :name => 'daihatu', :owner_id => o3.id
