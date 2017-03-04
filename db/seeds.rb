Role.create({ name: :admin }) unless Role.exists?(name: :admin)
Role.create({ name: :user  }) unless Role.exists?(name: :user )
