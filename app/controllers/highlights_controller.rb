class HighlightsController < ApplicationController
	before_filter :extract_path, only: [:create, :update]

	def new
		@prospect = Prospect.find(params[:prospect_id])
		@highlight = @prospect.highlights.new
	end

	def create
		@prospect = Prospect.find(params[:prospect_id])
		@highlight = @prospect.highlights.new(highlight_params)
		if @highlight.save
			redirect_to @prospect
		else
			render 'new'
		end
	end

	def destroy
		@highlight = Highlight.find(params[:id])
		prospect = @highlight.prospect
		if @highlight.delete
			redirect_to prospect
		end
	end

	private

		def extract_path
			path = params[:highlight][:path]
			if path.include?('youtu')
				params[:highlight][:source] = 1
				if path.include?('?v=')
					params[:highlight][:path] = path.split("?v=")[1]
				elsif path.include?('.be')
					params[:highlight][:path] = path.split("/").last
				end
			elsif path.include?('vimeo')
				params[:highlight][:source] = 2
				params[:highlight][:path] = path.split("/").last
			elsif path.include?('hudl')
				params[:highlight][:source] = 3
				if path.include?('/v/')
					url = URI.parse(path)
					res = Net::HTTP.start(url.host, url.port) { |http| http.get(url.request_uri)}
					loc = res['location']
					path = loc
				end
				params[:highlight][:path] = path.split('/video/').last

			end
		end

		def highlight_params
			params.require(:highlight).permit(
				:source,
				:path)
		end

end
