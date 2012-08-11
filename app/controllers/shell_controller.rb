class ShellController < ApplicationController

=begin 

Controller Description
  
  This controller is for testing and development only

=end

  before_filter :set_paths

  def set_paths
    @upload = ''
    @sox = ''
    @uploaded_file_path = params[:mp3].tempfile.path.to_s if request.post?
    @new_mp3_audio_path = "/audios#{@uploaded_file_path}"
    @new_mp3_public_path = "public#{@new_mp3_audio_path}"
    # @download_path = 'public/downloads'
  end

  def index
    # render 'shell/index'
  end

  def player
    FileUtils.mv @uploaded_file_path, "#{@new_mp3_public_path}.mp3"
  end

  def upload
    # render 'shell/upload'
  end

  def reverse
    if request.post?
      FileUtils.mv @uploaded_file_path, "#{@new_mp3_public_path}r.mp3"
      @sox = `sox #{@new_mp3_public_path}r.mp3 #{@new_mp3_public_path}.mp3 reverse`
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