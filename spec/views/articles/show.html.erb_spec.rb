require 'spec_helper'

describe "articles/show.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :nlaid => "Nlaid",
      :heading => "Heading",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Nlaid".to_s)
    rendered.should contain("Heading".to_s)
    rendered.should contain("MyText".to_s)
  end
end
