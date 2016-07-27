module ApplicationHelper

  def branch_info
    branch_name = `git rev-parse --abbrev-ref HEAD`
		branch_name == "master\n" ? style = "master" : style = ""
		content_tag :div, :class => "gitbranch #{style}" do
			content_tag :span, branch_name, :class => ""
		end
	end

end
