# Define your routes like this:
#
class Main::Application
  route "articles" do |r|
  	r.on :article_id do |article_id|
  		r.view "articles.show", id: article_id
  	end
    # Routes go here
  end
end
