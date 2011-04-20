class AlterDefinitionRenameIdSigla < ActiveRecord::Migration
  def self.up
    rename_column :definitions, :id_sigla, :sigla_id
  end

  def self.down
  end
end
