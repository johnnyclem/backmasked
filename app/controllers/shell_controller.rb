class ShellController < ApplicationController

  def index
    @output = `sox`    
  end

  def create
    #todo
  end

  def new
    #todo
  end

  def edit
    #todo
  end

  def show
    #todo
  end

  def update
    #todo
  end

  def destroy
    #todo
  end

  def reverse
    @output = `sox -V upload/test.mp3 upload/rev.mp3 reverse`
  end

  def trim
    @output = `sox -V upload/test.mp3 upload/trim.mp3 trim 0 10`
  end


end
