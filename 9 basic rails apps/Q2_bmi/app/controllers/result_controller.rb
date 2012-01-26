class ResultController < ApplicationController
  def index

      @detail = Detail.find(1)

      @myBmi = @detail.weight/(@detail.height * @detail.height)
      @myBmirounded = sprintf("%.2f", @myBmi)


  end

end
