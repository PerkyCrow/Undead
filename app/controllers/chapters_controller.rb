class ChaptersController < ApplicationController

  def prologue
    @chapter = {
      title: "Adobe Flash, A fallen Hero",
      category: "Prologue",
    }
  end

end
