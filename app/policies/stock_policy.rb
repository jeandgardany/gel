class StockPolicy < ApplicationPolicy

	def edit?
		user.admin?		
	end

	def new?
		user.admin?		
	end

	def update?
		user.admin?		
	end

	def destroy?
		user.admin?		
	end

	def input?
		user.admin?		
	end

	def exit?
		user.admin?		
	end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
