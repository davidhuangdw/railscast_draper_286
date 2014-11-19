class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def avatar
    h.image_tag("avatars/#{object.avatar_image_name}", class: "avatar")
  end

  def website
    if url.present?
      h.link_to url, url
    else
      h.content_tag :span, "No content"
    end
  end

  def bio
    h.sanitize markdown.render(object.bio) if object.bio.present?
  end

  def markdown
    @@markdown ||= Redcarpet::Markdown.
                    new(Redcarpet::Render::HTML.
                    new(prettify:true, hard_wrap:true),fence_code_blocks:true)
  end
end
