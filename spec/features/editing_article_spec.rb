require "rails_helper"
RSpec.feature "Editing and article" do 
  before do
    @article = Article.create(title: "Article title", body: "Article body blah blah")
  end
  
  scenario "A user edits an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Updated Title"
    fill_in "Body", with: "Updated Body"
    
    click_button "Update Article"
    
    expect(page).to have_content("Article has been updated.")
    expect(page).to have_content("Updated Title")
    expect(page).to have_content("Updated Body")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Body"
    
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been updated.")
    expect(page.current_path).to eq(article_path(@article))
  end
end