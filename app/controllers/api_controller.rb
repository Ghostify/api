class ApiController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def post_update_progress
    youtube_link = params["youtube_link"].to_s
    progress = params["progress"].to_s

    if not youtube_link.blank? or not progress.blank?
      result = Link.where(:youtube_link =>youtube_link).take
      result.progress = progress
      if progress.downcase == "distributed".downcase
        result.seen_count += 1
      end
      result.save

      render :json => result

    else
      render :json => "FAILED. Missing youtube_link or progress. " + params.to_s
    end
  end

  def create
    @link = Link.new

    # Custom
    @link.full_link = params["full_link"]
    # Setting youtube_link
    full_link = params["full_link"].to_s
    full_link_parameters_hash = Rack::Utils.parse_nested_query(full_link[full_link.index("?") + 1, full_link.length])
    @link.youtube_link = full_link_parameters_hash["v"]

    if @link.save
      render :json => @link
    else
      render :json => "FAILED. No full_link or link not unique"
    end

  end



  def channel_create
    args = {}
    args["url"] = params["url"]

    channel = Channel.new(args)

    if args["url"]

      if channel.save
        render :json => channel
      else
        render :json => "Could not save. Duplicate data?"
      end
    else
      render :json => "url not provided"
    end
  end

  def channel_update
    args = {}
    args["url"] = params["url"]
    args["progress"] = params["progress"]

    if args["url"] and args["progress"]
      if channel = Channel.where(:url => args["url"]).take
        channel.progress = args["progress"]
        if channel.save
          render :json => channel
        else
          render :json => "Error saving."
        end
      else
        render :json => "Channel not found"
      end
    else
      render :json => "url and progress not provided"
    end

  end

end
