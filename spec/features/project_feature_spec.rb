require 'spec_helper'
require 'rails_helper'

RSpec.describe 'projects' do
	let!(:account) { create(:account_with_schema) }
	let(:user) { account.owner }

	before do 
		set_subdomain(account.subdomain)
		sign_user_in(user)
	end

	it "allows projects to be created" do
		visit root_path
		click_link "New Project"

		fill_in "Name", with: "A great project"
		fill_in "Client", with: "NASA"
		expect(page).to_not have_text "Archived"
		click_button "Create Project"

		expect(page).to have_text "Project created!"
		expect(page).to have_text "A great project"
	end

	it "displays project validations" do
		visit root_path
		click_link "New Project"

		click_button "Create Project"
		expect(page).to have_text "can't be blank"
	end

	it "allows projects to be edited" do
		project = create(:project)

		visit root_path
		click_edit_project_button project.name

		fill_in "Name", with: "A new name"
		check "Archived"
		click_button "Update Project"

		expect(page).to have_text "Project updated!"
		expect(page).to have_text "A new name"
	end

	it "allows entries to be added to projects" do
		project = create(:project)

		visit root_path
		click_entry_project_button project.name

		fill_in "Date", with: "May 2nd 2015"
		fill_in "Time", with: "2 Hours"
		click_button "Add Entry"

		expect(page).to have_text "Entry added!"
		expect(page).to have_text "May 2nd 2015"
	end

	def click_edit_project_button(project_name)
		within find("h3", text: project_name) do
			page.first("a").click
		end
	end

	def click_entry_project_button(project_name)
		within find("h3", text: project_name) do
			page.find("a:eq(2)").click
		end
	end
end