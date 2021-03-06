module Contests::BaseHelper
  def update_page_new_form(contest, choice)
    page.replace_html 'contest-edit-window', :file => "contests/#{contest.class.to_s.downcase}/edit_window", :use_full_path => true
    page.show('contest-edit-window')
    page << "document.getElementById('contest-edit-window').style.visibility = 'visible'"
  end
end
