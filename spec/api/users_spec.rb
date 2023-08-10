require 'rspec'
require_relative '../../lib/api_client'

describe 'Users API' do
  let(:user_data) do
    {
      name: 'John Doe',
      job: 'Tester'
    }
  end
  
  it 'returns a list of users' do
    users = APIClient::ReqRes.get_users
    expect(users).not_to be_empty
  end
  
  it 'returns user details' do
    user_id = 1
    user = APIClient::ReqRes.get_user(user_id)
    expect(user['id']).to eq(user_id)
  end
  
  it 'creates a new user' do
    response = APIClient::ReqRes.create_user(user_data)
    expect(response['name']).to eq(user_data[:name])
    expect(response['job']).to eq(user_data[:job])
  end
  
  it 'updates user details' do
    user_id = 1
    updated_data = {
      name: 'Jane Smith',
      job: 'Developer'
    }
    
    response = APIClient::ReqRes.update_user(user_id, updated_data)
    expect(response['name']).to eq(updated_data[:name])
    expect(response['job']).to eq(updated_data[:job])
  end
  
  it 'deletes a user' do
    user_id = 1
    response = APIClient::ReqRes.delete_user(user_id)
    expect(response).to be_equal(204)
    end
end
