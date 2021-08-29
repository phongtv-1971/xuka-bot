module Api
  class Usage
    def self.question
      <<~RAW
        [info][title]Question Usage[/title]
        If you want to create a question from chatwork, reply to the bot with the message format as below
        [code]
        QUESTION: What is your name?
        ANSWER: My name is Xuka
        [/code]
        What is your name? : Question content - required
        My name is Xuka : Answer of question - required
        [/info]
      RAW
    end
  end
end
