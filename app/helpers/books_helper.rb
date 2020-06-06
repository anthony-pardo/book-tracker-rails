module BooksHelper
  def user_select(book, isNested)
    if !isNested
      select_tag "book[user_id]", options_from_collection_for_select(User.all, :id, :name)
    else
      hidden_field_tag "book[user_id]", book.user_id
    end
  end
end
