Understanding what Mass Assingment is:

params[:user] = {:name => 'Foo',:email => 'foo@example.com'}
@user = User.new(params[:user])
.............................................................

steps for installation:

#application.rb
config.active_record.whitelist_attributes = true

#Gemfile
gem 'strong_parameters'

#model
class Post < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end

Then start using permit in your controller!
.......................................................
params.permit(:id)

the key :id will pass the whitelisting if it appears in params and it has a permitted scalar value associated. Otherwise, the key is going to be filtered out, so arrays, hashes, or any other objects cannot be injected.

The permitted scalar types are String, Symbol, NilClass, Numeric, TrueClass, FalseClass, Date, Time,  DateTime, StringIO, IO, ActionDispatch::Http::UploadedFile, and Rack::Test::UploadedFile.

Notice array is not listed. You wil have to list as this:

params.permit(id: [])
.............................................................

http://www.example.com/user/signup?user[name]=ow3ned&user[admin]=1
.............................................................

class PeopleController < ActionController::Base

#Using mass assignment:
  def create
    Person.create(params[:person])
  end

#Will pass because process is better defined and person key is in the parameters
  def update
    person = current_account.people.find(params[:id])
    person.update_attributes!(person_params)
    redirect_to person
  end

  #Preferred way of doing it - you'll be able to reuse the same permit list between create and update
   private

    def person_params
      params.require(:person).permit(:name, :age)
    end
end


#If you want to whitelist an array:
params.permit(:id => [])

#If you want to whitelist an entire hash of parameters, use the method permit!:
params.require(:log_entry).permit!

#Be careful on permit! as it allows all current and future model attributes to be mass-assigned

#If you want to use nested parameters
params.permit(:name, {:emails => []}, :friends => [ :name, { :family => [ :name ], :hobbies => [] }])

#Require them twice to check multiple keys are present:
params.require(:token)
params.require(:post).permit(:title)

#Unpermitted keys
#config.action_controller.action_on_unpermitted_parameters