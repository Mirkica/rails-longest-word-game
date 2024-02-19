require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @result = params[:result].split
    @board = params[:board].split
  end

  def included?(result, board)
    result.all? { |letter| result.count(letter) <= board.count(letter) }
  end

  def english_word(word)
    response URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    final_word = JSON.parse(response.read)
    final_word['found']
  end
end
