class HomeController < ApplicationController
  def nyumbani

  	require 'net/http'
  	require 'json'

  	@url='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=12345&distance=25&API_KEY=5FB794F3-25ED-4380-A106-E18113427397'
  	@uri=URI(@url) 
  	@response=Net::HTTP.get(@uri)

  	@output=JSON.parse(@response)

  	if @output.empty?
  		@final_result='Error'
  		@err_msg = 'Zipcode pre-entered within the API url does not exist! Please check.'
  	elsif !@output
  		@final_result='Error'
  	else
  		@final_result=@output[0]['AQI']
  		if @final_result<=50

  		@api_color='green'
  		@api_description='Air quality is satisfactory, and air pollution poses little or no risk.'

	  	elsif @final_result>=51 && @final_result<=100
	  		@api_color='yellow'
	  		@api_description='Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.'
	  	elsif @final_result>=101 && @final_result<=200
	  		@api_color='orange'
	  		@api_description='Members of sensitive groups may experience health effects. The general public is less likely to be affected.'
	  	elsif @final_result>=201 && @final_result<=300
	  		@api_color='red'
	  		@api_description='Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.'
		elsif @final_result>=201 && @final_result<=300
	  		@api_color='purple'
	  		@api_description='Health alert: The risk of health effects is increased for everyone.' 		
	  	elsif @final_result>=201 && @final_result<=300
	  		@api_color='maroon'
	  		@api_description='Health warning of emergency conditions: everyone is more likely to be affected'

  	end

  	end

=begin

  	if @final_result<=50

  		@api_color='green'
  		@api_description='Air quality is satisfactory, and air pollution poses little or no risk.'

  	elsif @final_result>=51 && @final_result<=100
  		@api_color='yellow'
  		@api_description='Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.'
  	elsif @final_result>=101 && @final_result<=200
  		@api_color='orange'
  		@api_description='Members of sensitive groups may experience health effects. The general public is less likely to be affected.'
  	elsif @final_result>=201 && @final_result<=300
  		@api_color='red'
  		@api_description='Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.'
	elsif @final_result>=201 && @final_result<=300
  		@api_color='purple'
  		@api_description='Health alert: The risk of health effects is increased for everyone.' 		
  	elsif @final_result>=201 && @final_result<=300
  		@api_color='maroon'
  		@api_description='Health warning of emergency conditions: everyone is more likely to be affected'

  	end
=end
  end

  	
 




 #zipcode controller 
  def zipcode #this is the controller that the 'post' method within the "routes.rb" file, 
  	#is referring to

  	@something = params[:zipcode] #this allows us to store the value of what we type within the search textbox
  	#defined within the 'navbar.html' file into a variable, '@something'. We can define an element within the 
  	#zipcode page with the '@something' tag so the alue of the @something variable is posted in the page
  	#where that tag appears. It's the @ssomething variable that is going to be concatenated to the URL above
  	#so as to query the API with the zipcode entered in the search box.

  	#some basic error handling

  	if params[:zipcode] == ""
  		@something = 'Hey you forgot to enter the zip code!!!'
  		@final_result = 'Error!'
  		@api_description = 'No results to display for now'
  		@api_color = 'gold'


  	elsif params[:zipcode] #do some API querying
  		require 'net/http'
		require 'json'

	  	@url='http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode='+ @something + '&distance=25&API_KEY=5FB794F3-25ED-4380-A106-E18113427397'
	  	@uri=URI(@url) #the to_s method allows us to convert whatever is entered within the search text box to be 
	  	#conVerted into a string and then added/concatenated to the API URL 
	  	@response=Net::HTTP.get(@uri)

	  	@output=JSON.parse(@response)

	  	if @output.empty?
	  		@final_result='Error!!'
	  		@err_msg = 'Zipcode entered does not exist!'
	  		
	  		
	  		
	  	elsif !@output
	  		@final_result='Error'
	  	else
	  		@final_result=@output[0]['AQI']
	  		@city = @output[0]['ReportingArea'] + ', '#extracts the area/city of reporting 
	  		@statecode = @output[0]['StateCode'] + ', '#extracts the state from which the areas are from
	  		@message = 'This is the current air quality for the area of '
	  		if @final_result<=50
	  			@api_color='green'
	  			@api_description='Air quality is satisfactory, and air pollution poses little or no risk.'

		  	elsif @final_result>=51 && @final_result<=100
		  		@api_color='yellow'
		  		@api_description='Air quality is acceptable. However, there may be a risk for some people, particularly those who are unusually sensitive to air pollution.'
		  	elsif @final_result>=101 && @final_result<=200
		  		@api_color='orange'
		  		@api_description='Members of sensitive groups may experience health effects. The general public is less likely to be affected.'
		  	elsif @final_result>=201 && @final_result<=300
		  		@api_color='red'
		  		@api_description='Some members of the general public may experience health effects; members of sensitive groups may experience more serious health effects.'
			elsif @final_result>=201 && @final_result<=300
		  		@api_color='purple'
		  		@api_description='Health alert: The risk of health effects is increased for everyone.' 		
		  	elsif @final_result>=201 && @final_result<=300
		  		@api_color='maroon'
		  		@api_description='Health warning of emergency conditions: everyone is more likely to be affected'

		  	end

	  		

	  	end

	  	
	 


  	
			
  	
	end


  	
  end

  	






	

	
end


	

	

 

 



