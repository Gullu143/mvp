# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(seller)
  seller ||= Seller.new
      if seller.admin?
        can :manage, :all   
        can :manage, :admin_dashboard
        can :manage, Article
      else
        can :manage, Article, seller_id: seller.id
      end
  end
end