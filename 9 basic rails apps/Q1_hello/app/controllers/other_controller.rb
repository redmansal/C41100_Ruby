class OtherController < ApplicationController 

  #this method name is called when the user enters the site from the main controller
  #by only using this controller to display name.html we ensure no blanck data such as ,,,10 gets inserted into the database
  def name
  end
  
  #only when the user fills in his name details  will this method be called. This will now create an entry in the database
  def saveName 
      #the two lines below use the the http GET verb to get info from the url 
     @fname = params[:fst_name]
     @lname = params[:lst_name]
     #inserting a record into the databse
     @entry = Entry.create({:first_name => @fname, :last_name =>  @lname})
  end
  
  #this method finds the last entry into the database and modefies it so the address, salary, loan and loan reason are recorded.
  def index
     #finding the last record
     @person = Entry.find(:last)
     #assiging values to @fname object variable
     @fname = @person.first_name
     @lname = @person.last_name
     #updating that particular record
     @person.update_attributes({:address => params[:st_name], 
         :salary => params[:salary], :loan => params[:loan], 
             :loan_reason => params[:reason]})
     #if the user sends back nothing just call the show method to isplay the current object 
     if !@person.address.nil? then render "show" end
  end

  #this method find the last entry in the database and populates the @person object
  def show
	 @person = Entry.find(:last)
  end
  
  #edit the details of a record
  def change
	 @person = Entry.find(:last)
	 @fname = @person.first_name
     @lname = @person.last_name
	 #@entry = Entry.create({:first_name => @fname, :last_name =>  @lname,  
	 #                       :salary => params[:salary], :loan => params[:loan]})
         #note here I changed the method from create into an update_attributes which stopps duplicate data entries into the database 
	 @person.update_attributes({:first_name => @fname, :last_name =>  @lname,  
	                        :salary => params[:salary], :loan => params[:loan]})
  end
  
  #this method figures out a message to send to the user based on the salary and loan amount request
 def quote
	 @person = Entry.find(:last)
	 if !@person.salary.nil? then
	   if (@person.salary *  3) < @person.loan
			then @message = "You goddam pauper, you asked us for a loan that is:
							 more than three times your salary. \n Please go back 
							and re-enter your correct salary."
	   else  @message = "Sure thing baby..." 
	   end
	else @message = "Seem to have an empty record??"
	end
 end


end
