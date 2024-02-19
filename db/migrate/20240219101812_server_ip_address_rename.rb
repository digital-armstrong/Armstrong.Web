class ServerIpAddressRename < ActiveRecord::Migration[7.0]
  def change
    rename_column :servers, :ip_adress, :ip_address
  end
end
