require 'faraday'

class MailchimpService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def add_user
    dc = ENV['MAILCHIMP_SERVER']
    unique_id = ENV['MAILCHIMP_UNIQ_ID']
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{unique_id}/members"
    api_key = ENV['MAILCHIMP_API_KEY']

    user_details = {
      email_address: user.email,
      status: "subscribed",
      merge_fields: {
        FNAME: user.first_name,
        LNAME: user.last_name
      },
    };

    conn = Faraday.new(
      url: url,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization': "Bearer #{api_key}"
      }
    )

    response = conn.post do |req|
      req.body = user_details.to_json
    end
    response_body = JSON.parse(response.body)
    if response.status == 200
      p "#{user.email} has been added to the mailing list"
    else
      p  "Mailchimp error: #{response.status}"
      p "#{response_body['detail']}"
    end
  end
end
