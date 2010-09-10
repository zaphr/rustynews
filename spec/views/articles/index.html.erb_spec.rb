require 'spec_helper'

describe "articles/index.html.erb" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :nlaid => "Nlaid",
        :heading => "Heading",
        :body => "MyText"
      ),
      stub_model(Article,
        :nlaid => "Nlaid",
        :heading => "Heading",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    rendered.should have_selector("tr>td", :content => "Nlaid".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Heading".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
