module ArticlesHelper

  def random_article_id_excluding(id)
    # Create new array as cache returns a frozen array
    all_ids = Array.new(Article.all_ids_cached)
    all_ids.delete(id)
    all_ids.rand
  end

  def next_id_in_collection(collection, current_id)
    collection = grim_collection_ids
    current_found = false
    collection.each do |article_id|
      return article_id if current_found
      current_found = true if article_id == current_id
    end
    collection.first
  end

  def grim_collection_ids
    nlaids = ["10338586", "10565136", "9555477", "23093072", "1986527", "9162722", "8229720",
              "11989634", "12067417", "11373385", "12451710", "5925522", "22435946", "4694644",
              "10863925", "10700230", "12432088", "10194263", "6282676"]


#    Rails.cache.delete('Article.grim_ids')
    Rails.cache.fetch('Article.grim_ids'){Article.ids_for_nlaids(nlaids)}
  end


end
