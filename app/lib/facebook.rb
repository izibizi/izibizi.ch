class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  def initialize(page_id, access_token)
    @page_id = page_id
    @credentials = { access_token: access_token }
  end

  def albums(opts = {})
    query = { fields: 'id,name,cover_photo{id},type' }
      .merge(opts).merge(@credentials)

    response = self.class.get "/#{@page_id}/albums", { query: query }
    response['data'].reject! { |row| row['type'] != 'normal' }
    response
  end
end
