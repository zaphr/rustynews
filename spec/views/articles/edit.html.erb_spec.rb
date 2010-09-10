require 'spec_helper'

describe "articles/edit.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :new_record? => false,
      :nlaid => "MyString",
      :heading => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit article form" do
    render

    rendered.should have_selector("form", :action => article_path(@article), :method => "post") do |form|
      form.should have_selector("input#article_nlaid", :name => "article[nlaid]")
      form.should have_selector("input#article_heading", :name => "article[heading]")
      form.should have_selector("textarea#article_body", :name => "article[body]")
    end
  end
end
