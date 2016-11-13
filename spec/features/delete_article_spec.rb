require 'rails_helper'
RSpec.feature "Deleting an Article" do
  before do
    john = User.create(email: "John@example.com", password: "password")
    login_as john
    @article = Article.create(title: "New Article to Delete", body: "New Article Body", user: john)
  end
  
  scenario  "A user deletes an article" do 
    visit "/"
    
    click_link @article.title
    click_link "Delete Article"
    
    expect(page).to have_content("Article has been deleted.")
    expect(current_path).to eq(articles_path)
  end
end