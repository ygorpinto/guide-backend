# spec/integration/stock_spec.rb
require 'swagger_helper'

describe 'Stock API' do

  path '/api/v1/stock' do

    post 'Creates a stock' do
      tags 'stock'
      consumes 'application/json', 'application/xml'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo_url: { type: :string },
          status: { type: :string }
        },
        required: [ 'name', 'status' ]
      }

      response '201', 'stock created' do
        let(:stock) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:stock) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/stock/{id}' do

    get 'Retrieves a stock' do
      tags 'stock'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            photo_url: { type: :string },
            status: { type: :string }
          },
          required: [ 'id', 'name', 'status' ]

        let(:id) { stock.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'stock not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end