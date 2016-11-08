class TvguideController < ApplicationController
  def get
  		channels = {}
  		shows = []
  		Channel.find_each do |channel|
  			showsByChannel = Show.where(:channel_id => channel.id)
  		 	showsByChannel.each do |show|
  		 		showSchedule = Schedule.where(:show => show.id)
  		 		shows.push(showSchedule)
  		 	end
		end

		if !params[:start].nil?
			filterDate = DateTime.parse(params[:start])
		else
			filterDate = Time.now
		end

		shows = Schedule.left_outer_joins(:show, show:[:channel, :category, channel:[:category]]).select('
			channels.id as channel_id,
			channels.name as channel_name,
			shows.id as show_id,
			shows.name as show_name,
			schedules.start as show_start,
			schedules.stop as show_stop,
			categories_shows.id as category_show_id,
			categories_shows.name as category_show_name,
			categories.id as category_channel_id,
			categories.name as category_channel_name,
			schedules.id as id')
		.where('schedules.start >= ?', filterDate)
		.where('schedules.stop <= ?', filterDate + 30.days)

  	 return render :json => shows.to_json
  end
end
