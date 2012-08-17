class ShellController < ApplicationController

=begin 

Controller Description
  
  This controller is for testing and development only

=end

  before_filter :init

  def init
    @upload = ''
    @sox = ''
    @data = Mp3data.new
  end

#  def index
    # render 'shell/index'
#  end

#  def player # move file before playing
#  end

#  def upload # load a simple upload
#  end

  def reverse
    if request.post?
      @audio = input_mp3_path = params[:mp3].tempfile.path.to_s if request.post?
      new_mp3_path = "#{Rails.root}/public/audios#{input_mp3_path}"
      FileUtils.mv @audio, "#{new_mp3_path}.mp3"
      @sox = `sox #{new_mp3_path}.mp3 #{new_mp3_path}r.mp3 reverse`
      #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      #Tag Info Code
      #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
      mp3path = new_mp3_path + ".mp3"
      Mp3Info.open(mp3path) do |mp3|
          @data.song = mp3.tag.title   
          @data.artist = mp3.tag.artist   
          @data.album = mp3.tag.album
          @data.save!
      end
      #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      render 'shell/player'
    else
      render 'shell/upload'
    end
  end

=begin Trim Function, future feature

  def trim
    @output = `sox upload/#{params[:input]}.mp3 download/#{params[:output]}.mp3 trim #{params[:start]} #{params[:finish]}`
    @uploaded_file_path = params[:mp3].tempfile.path.to_s
    render 'shell/player'
  end

=begin Run Function, future refactor

  def run(input, output, cmd)
    `sox #{@upload_path}/#{:input}.mp3 #{@download_path}/#{:output}.mp3 #{:cmd}`
  end

=end

end