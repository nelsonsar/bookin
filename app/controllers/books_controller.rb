class BooksController < ApplicationController
  before_filter :load_book_service

  NewBookRequest = Struct.new(:name, :author, :tags)

  def new
    @book = Book.new
    render :new
  end

  def create
    guid = @book_service.add_to_library new_book_request(params)

    redirect_to action: 'show', guid: guid
  end

  def show
    render :show
  end

  def load_book_service(service = BookService.new)
    @book_service ||= service
  end

  private

  def new_book_request(params)
    book_name = params[:book][:name]
    book_author = params[:book][:author]
    book_tags = params[:book][:tags]

    NewBookRequest.new(book_name, book_author, book_tags)
  end
end
