class Article < ActiveRecord::Base

  after_save :empty_cache
  after_destroy :empty_cache


  def self.all_ids_cached
    Rails.cache.fetch('Article.all_ids') {all.collect{|article| article.id}}
  end

  private

  def empty_cache
    Rails.cache.delete('Article.all_ids')
  end

end
