require './app'

def main
  app = App.new

  loop do
    app.run
  end
end

main
