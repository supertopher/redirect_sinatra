class RemoveShortUrlFromUrls < ActiveRecord::Migration
  def change
    remove_column :urls, :short_url
  end
end
