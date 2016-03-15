class FinancesController < ApplicationController
	def index
		@finances = Finance.all
	end
end
