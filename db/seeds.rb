# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all


User.create(
	name: 'admin',
	password: '123456789',
	password_confirmation: '123456789',
	identity: 'administrator'
	)

User.create(
	name: 'test1',
    password: '123',
    password_confirmation: '123',
    identity: 'normal'
	)

User.create(
	name: 'test2',
    password: '123',
    password_confirmation: '123',
    identity: 'normal'
	)

