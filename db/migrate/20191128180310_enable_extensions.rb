# This migration comes from active_storage (originally 20170806125915)
class EnableExtensions < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
  end
end
