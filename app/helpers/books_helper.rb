module BooksHelper
  def book_select
    select_tag "book[user_id]", options_from_collection_for_select(User.all, :id, :name)
  end
end
