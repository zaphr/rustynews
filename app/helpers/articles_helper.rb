module ArticlesHelper

  def random_article_id_excluding(id)
    # Create new array as cache returns a frozen array
    all_ids = Array.new(Article.all_ids_cached)
    all_ids.delete(id)
    all_ids.rand
  end

  def next_id_in_collection(collection, current_id)
    collection = Article.all_ids_cached
    current_found = false
    collection.each do |article_id|
      return article_id if current_found
      current_found = true if article_id == current_id
    end
    collection.first
  end


end
