require "db_spec_helper"
require "main/views/home"
require "main/view/context"

RSpec.describe Main::Views::Home, "#call", type: :view do
  subject(:view) { described_class.new }

  let(:context) {
    Main::View::Context.new(
      fullpath: "/",
      csrf_metatag: -> { "xxx" },
      csrf_tag: -> { "xxx" },
      csrf_token: -> { "xxx" },
      flash: {},
    )
  }

  let(:html) { view.(context: context) }
  let(:page) { Capybara.string(html) }

  before do
    Factory[:published_article, title: "My 1st article", published_at: TimeMath.week.decrease(Time.now, 2)]
    Factory[:published_article, title: "My 2nd article", published_at: TimeMath.week.decrease(Time.now, 1)]
  end

  it "renders the articles in date-descending order" do
    expect(page).to have_selector ".article:nth-of-type(1) h2", text: "My 2nd article"
    expect(page).to have_selector ".article:nth-of-type(2) h2", text: "My 1st article"
  end
end
