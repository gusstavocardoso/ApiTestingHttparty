require 'httparty'

module APIClient
  class ReqRes
    BASE_URL = 'https://reqres.in/api'.freeze
    
    def self.get_users(page = 1)
      response = HTTParty.get("#{BASE_URL}/users?page=#{page}")
      response.parsed_response['data']
    end
    
    def self.get_user(user_id)
      response = HTTParty.get("#{BASE_URL}/users/#{user_id}")
      response.parsed_response['data']
    end
    
    def self.create_user(user_data)
      response = HTTParty.post("#{BASE_URL}/users", body: user_data)
      response.parsed_response
    end
    
    def self.update_user(user_id, updated_data)
      response = HTTParty.put("#{BASE_URL}/users/#{user_id}", body: updated_data)
      response.parsed_response
    end
    
    def self.delete_user(user_id)
      response = HTTParty.delete("#{BASE_URL}/users/#{user_id}")
      response.code
    end
  end
end
