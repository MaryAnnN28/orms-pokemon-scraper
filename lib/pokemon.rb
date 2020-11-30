class Pokemon

     attr_accessor :id, :name, :type, :db

     def initialize(id:, name:, type:, db:)
          @id = id
          @name = name
          @type = type
          @db = db
     end

     def self.save(id:, name:, type:)
          if self.id
               self.update
          else
               sql = <<-SQL
               INSERT INTO pokemon (name)
               VALUES (?)
               SQL
               DB[:conn].execute(sql, self.id, self.name, self.type)
               @id = DB[:conn].execute("SELECT * FROM pokemon WHERE name = ?")[0][0]
          end
     end


end
