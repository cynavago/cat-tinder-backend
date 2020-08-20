require 'rails_helper'

describe "Cats", type: :request do
  it "gets a list of Cats" do
    # Create a new cat in the Test Database (this is not the same one as development)
    Cat.create(name: 'Felix', age: 2, enjoys: 'Walks in the park', story: 'story', image: 'image')

    # Make a request to the API
    get '/cats'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to have_http_status(:ok)

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end

  it "creates a cat" do
    # The params we are going to send with the request
    cat_params = {
      cat: {
        name: 'Buster',
        age: 4,
        enjoys: 'Meow Mix, and plenty of sunshine.',
        story: 'Loves to eat. Hates cucumbers.',
        image: 'image of Buster'
      }
    }

    # Send the request to the server
    post '/cats', params: cat_params

    # Assure that we get a success back
    expect(response).to have_http_status(:ok)

    # Look up the cat we expect to be created in the Database
    cat = Cat.first

    # Assure that the created cat has the correct attributes
    expect(cat.name).to eq 'Buster'
  end

  it "doesn't create a cat without a name" do
    cat_params = {
      cat: {
        age: 2,
        enjoys: 'Walks',
        story: 'things',
        image: 'picture'
      }
    }
    # Send the request to the  server
    post '/cats', params: cat_params
    # expect an error if the cat_params does not have a name
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    cats = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    # NOTE: The string that follows .include is NOT arbitrary
    expect(cats['name']).to include "can't be blank"
  end

  it "doesn't create a cat that has an enjoys category with less than 10 characters" do
    cat_params = {
      cat: {
        name:'Benedict',
        age: 2,
        enjoys: 'Walks',
        story: 'things',
        image: 'picture'
      }
    }
    # Send the request to the  server
    post '/cats', params: cat_params
    # expect an error if the enjoys is not 10 characters at least
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    cats = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    # NOTE: The string that follows .include is NOT arbitrary
    expect(cats['enjoys']).to include "is too short (minimum is 10 characters)"
  end

end
