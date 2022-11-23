require 'swagger_helper'

RSpec.describe 'api/v1/stocks', type: :request do

  path '/api/v1/stocks' do
    get('list stocks') do
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
        run_test!
      end
    end

    post('create stock') do
      consumes 'application/json'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          symbol: { type: :string },
          price: { type: :string },
          date:  {type: :string},
        },
        required: %w[name model]
      }
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
      end
    end
  end

  path '/api/v1/stocks/{id}' do
    parameter id: 'id', in: :path, type: :string, description: 'id'
    let(:id){'1'}
    get('show stock') do
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
      end
    end

    patch('update stock') do
      consumes 'application/json'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          symbol: { type: :string },
          price: { type: :string },
          date:  {type: :string},
        },
        required: %w[name model]
      }
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
      end
    end

    put('update stock') do
      consumes 'application/json'
      parameter name: :stock, in: :body, schema: {
        type: :object,
        properties: {
          symbol: { type: :string },
          price: { type: :string },
          date:  {type: :string},
        },
        required: %w[name model]
      }
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
      end
    end

    delete('delete stock') do      
      response(200, 'successful') do
        let!(:stock){ {price:23.00, date:Time.now.to_datetime, symbol:"PETR3", rentability: 0} }
      end
    end
  end
end
