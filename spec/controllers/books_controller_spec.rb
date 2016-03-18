require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#new' do
    it 'renders book form' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do

    let (:book_service) { instance_double('BookService') }

    before do
      controller.load_book_service book_service
    end

    context 'when all fields are valid' do
      it 'redirect to created book page' do
        book_name = 'Foo bar'
        book_author = 'John Doe'
        book_tags = 'bar, foo, baz'
        guid = '12a91c17-5b91-40b1-99ca-dfd9cd41587e'

        attributes = {
          :name => book_name,
          :author => book_author,
          :tags => book_tags
        }

        request = BooksController::NewBookRequest.new(
          book_name,
          book_author,
          book_tags
        )

        expect(book_service).to receive(:add_to_library).with(request)
          .and_return(guid)

        post :create, :book => attributes
        expect(response).to redirect_to "/books/show/#{guid}"
      end
    end

    context 'when one field is invalid' do
      it 'renders new form with errors' do

      end
    end
  end
end
