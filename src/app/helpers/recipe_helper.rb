module RecipeHelper
  # I am not using this method, instead I used ContentfulModel::Base, but I wanted to show
  # How the code would look like if I would have used the Contentful basic SDK
  def self.recipes(id = nil)
    @client ||= Contentful::Client.new(
      access_token: Rails.application.credentials[:contentful_access_token],
      space: Rails.application.credentials[:contentful_space_id],
      environment: Rails.application.credentials[:contentful_env_id],
      dynamic_entries: :auto,
      raise_errors: true,
    )

    id.nil? ?
      @client.entries(content_type: "recipe", include: 1) :
      @client.entry(id, content_type: "recipe", include: 1)
  end

  def self.markdown(text)
    Markdown.new(text).to_html.html_safe
  end
end
