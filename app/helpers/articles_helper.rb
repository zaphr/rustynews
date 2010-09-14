module ArticlesHelper

  def random_article_id_excluding(id)
    # Create new array as cache returns a frozen array
    all_ids = Array.new(Article.all_ids_cached)
    all_ids.delete(id)
    all_ids.rand
  end




end
