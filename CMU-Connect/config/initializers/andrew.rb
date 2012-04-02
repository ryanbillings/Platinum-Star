module ClientSideValidations::Middleware
	class ::Andrew < Base
	def response
	  status = 0
	  begin 
	    CMU_Person::find(:id => request.params[:id])
		status = 200
	  rescue
	    status = 404
	  end
	  self.status = status
	  super
	 end
	end
end
		