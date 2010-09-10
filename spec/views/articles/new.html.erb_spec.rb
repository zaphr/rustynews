require 'spec_helper'

describe "articles/new.html.erb" do
  before(:each) do
    assign(:article, stub_model(Article,
      :new_record? => true,
      :nlaid => "MyString",
      :heading => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new article form" do
    render

    rendered.should have_selector("form", :action => articles_path, :method => "post") do |form|
      form.should have_selector("input#article_nlaid", :name => "article[nlaid]")
      form.should have_selector("input#article_heading", :name => "article[heading]")
      form.should have_selector("textarea#article_body", :name => "article[body]")
    end
  end
end
