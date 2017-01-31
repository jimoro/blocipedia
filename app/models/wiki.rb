class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators

  # Following block replaced by two 'has_many' lines above
  # delegate :users, to: :collaborators
  #
  # def collaborators
  #   Collaborator.where(wiki_id: id)
  # end

# New body method adding using Recarpet is created to replace the default 'body' method

  # def body
  #   text = read_attribute(:body)
  #
  #   markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  #
  #   markdown.render(text)
  # end
# When it gets called like this...
#    <%= @wiki.body %>
# ...the new code is used.

end
