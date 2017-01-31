class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end


  def destroy?
    @user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      puts "Top of 'resolve' -- user.role is " + user.role
      wikis = []
      if user.role == "admin"
        puts "Recognized admin user"
        wikis = scope.all  # if the user is an admin, show them all the wikis
      elsif user.role == "premium"
        puts "Recognized premium user"
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki  # if the user is premium, only show them public wikis, private wikis they created, or private wikis that they are a collaborator on
          end
        end
      else  # if only a standard user
        puts "User not recognized as admin or premium, so treat as standard"
        puts "User role: " + user.role
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private || wiki.collaborators.include?(user)
            wikis << wiki  # only show public wikis and private wikis that they are a collaborator on
          end
        end
      end
      wikis  # return the wikis array we've built up
    end

  end

end
