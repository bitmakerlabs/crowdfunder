require_relative '../test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'A tag can be added to a project' do
    project = new_project
    project.user = new_user
    tag = Tag.new(name: 'Video Games')

    project.tags << tag
    project.save

    results = project.tags.size
    expected = 1
    assert_equal expected, results
  end

  test 'find project with tag name' do
    project = new_project
    project.user = new_user
    tag = Tag.new(name: 'Video Games')

    project.tags << tag
    project.save

    results = Project.tag_ids.where(:name => ['Video Games']).size
    expected = 1
    assert_equal(expected, results)

  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

end
