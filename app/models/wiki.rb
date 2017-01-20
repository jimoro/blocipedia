class Wiki < ActiveRecord::Base
  belongs_to :user

#
# New body method adding using Recarpet is created to replace the default 'body' method

#   def body
#     text = read_attribute(:body)
#
#     markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
#
#     markdown.render(text)
#   end
#
# So when it gets called like this:
#    <%= @wiki.body %>
# ...the new code is used.

end
