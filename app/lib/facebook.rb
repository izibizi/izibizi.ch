class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  def initialize(page_id, app_id, app_secret)
    @page_id = page_id
    @credentials = { access_token: [app_id, app_secret].join('|') }
  end

  def albums(opts = {})
    query = { fields: 'id,name,cover_photo,type' }
      .merge(opts).merge(@credentials)

    response = self.class.get "/#{@page_id}/albums", { query: query }
    response['data'].reject! { |row| row['type'] != 'normal' }
    response
  end
end
