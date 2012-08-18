class ShellController < ApplicationController

=begin 

Controller Description
  
  This controller is for testing and development only

=end

  before_filter :init

  def init
    @upload = ''
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
      # Raw Implementation
      #============================================================
      @upload = params[:mp3]
      filename = @upload.original_filename
      filetype = @upload.content_type
      @tmp_path = @upload.tempfile.path

      @np = new_path = "#{Rails.root}/public/audios#{@tmp_path}"
      FileUtils.mv @tmp_path, "#{new_path}.mp3"

      @sox = `sox #{new_path}.mp3 #{new_path}r.mp3 reverse`

      render 'shell/player'
      #============================================================
      # render 'shell/index'
    else
      render 'shell/upload'
    end
  end

  def sox

    Sox.command do |sox|
      @sox = sox
      sox.input "input1.wav"
      sox.input "input2", :type => "ogg"
      sox.output "output", :type => "ogg", :compression => 8
    end

    render 'shell/index'

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