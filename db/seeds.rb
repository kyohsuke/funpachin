# -*- encoding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["確定", "予定", "見送り", "これから聞く"].each do |state|
  Status.create({detail: state})
end


# Administrator Accounts Here (twitter accounts)
['kyohsuke'].each do |name|
  AccountManager.create({screen_name: name})
end
