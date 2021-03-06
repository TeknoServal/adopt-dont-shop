require 'rails_helper'

# User Story 20, Submit an Application

# As a visitor
# When I visit an application's show page
# And I have added one or more pets to the application
# Then I see a section to submit my application
# And in that section I see an input to enter why I would make a good owner for these pet(s)
# When I fill in that input
# And I click a button to submit this application
# Then I am taken back to the application's show page
# And I see an indicator that the application is "Pending"
# And I see all the pets that I want to adopt
# And I do not see a section to add more pets to this application

describe 'as a visitor' do
  before(:each) do
    @shelter = Shelter.create(name: 'Bobby',
                                address: '123 halmock st',
                                city: 'dover',
                                state: 'florida',
                                zip: '12345')
      @user = User.create(name: 'Jake',
                          address: '1234 1st St',
                          city: 'Denver',
                          state: 'CO',
                          zip: '80213')
      @pet1 = Pet.create({
                        name: 'Jack',
                        image: 'https://images.dog.ceo/breeds/affenpinscher/n02110627_13014.jpg',
                        age: 4,
                        sex: 'Male',
                        adoptable: true,
                        description: 'small black dog',
                        shelter_id: @shelter.id
                      })
      @pet2 = Pet.create({
                        name: 'Charles',
                        image: 'https://images.dog.ceo/breeds/terrier-norwich/n02094258_230.jpg',
                        age: 2,
                        sex: 'Male',
                        adoptable: true,
                        description: 'this is a dog',
                        shelter_id: @shelter.id
                      })
      @pet3 = Pet.create({
                        name: 'Rascal',
                        image: 'https://images.dog.ceo/breeds/spaniel-sussex/n02102480_5808.jpg',
                        age: 3,
                        sex: 'Male',
                        adoptable: true,
                        description: 'this dog has won some medals',
                        shelter_id: @shelter.id
                      })
      @application = Application.create({
                        user: @user,
                        description: "I have a great house for a dog",
                        status: "In Progress"
      })

      ApplicationPet.create(application: @application, pet: @pet1)
      ApplicationPet.create(application: @application, pet: @pet2)
      
    end
    describe 'when i visit application show page and have added a pet but no reason' do
      it 'I can click submit, but am directed to the show page with a warning message that reason is required' do
        
        @application2 = Application.create({user: @user, status: "In Progress"})
        ApplicationPet.create(application: @application2, pet: @pet1)

        visit "/applications/#{@application2.id}"

        click_button "Submit Application"
        expect(current_path).to eq("/applications/#{@application2.id}")
        expect(@application2.status).to eq("In Progress")
        expect(page).to have_content("A reason for adoption is required before submission")

    end
  end
  
  describe 'when i visit an app show page and have added pets and a reason' do
    it 'I can click the submit button which returns me to show page with pending app status' do
      visit "applications/#{@application.id}"
      click_button("Submit Application")
      expect(current_path).to eq("/applications/#{@application.id}")
      expect(page).to have_content("Pending")
    end

    it "when submitted, I don't see a section to add more pets on the show page" do
      visit "applications/#{@application.id}"
      expect(page).to have_selector("#pet-search")
      click_button("Submit Application")
      expect(current_path).to eq("/applications/#{@application.id}")
      expect(page).to_not have_selector("#pet-search")
    end
  end
end
