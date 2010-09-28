class Article < ActiveRecord::Base

  after_save :empty_cache
  after_destroy :empty_cache


  def self.all_ids_cached
    Rails.cache.fetch('Article.all_ids') {all.collect{|article| article.id}}
  end

  def self.all_nlaids
    all.collect{|article| article.nlaid}
  end

  def self.ids_for_nlaids(nlaids)
#    Rails.cache.fetch('Article.nlaids_for') do
      ids = []
      nlaids.each do |nlaid|
        ids << Article.find_by_nlaid(nlaid).id
      end
      ids
#    end
  end

  def self.nlaids_for_ids(ids)
        nlaids = []
        ids.each do |id|
          nlaids << Article.find_by_id(id).nlaid
        end
        nlaids
  end

  def self.home_article
#    Rails.cache.delete('Article.home_article')
    Rails.cache.fetch('Article.home_article') {find_by_nlaid('9555477')}
  end

  private

  def empty_cache
    Rails.cache.delete('Article.all_ids')
#    Rails.cache.delete('Article.nlaids_for')
  end

  ## [34, 3, 35, 1, 2,12,13,14,16,19,22,23,25,28,29,30,31,32,33]

end
