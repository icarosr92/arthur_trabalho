class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :tel_residencial
      t.string :tel_celular
      t.string :tel_comercial

      t.timestamps
    end
  end
end
