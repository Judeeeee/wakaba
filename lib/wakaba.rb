# frozen_string_literal: true

require_relative 'wakaba/version'

# main module
module Wakaba
  class Error < StandardError; end

  # propose a solution in Japanese
  module ExceptionJp
    def output_message(error_type)
      case error_type
      when NoMethodError
        <<~SUGGESTION


          ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
          | ・ #{name}という名前のメソッドは存在するかにゃ？
          | ・ #{name}を呼び出したけどレシーバがnilにゃ？
          ╰━ｖ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
          🐈🐈


        SUGGESTION
      when NameError
        <<~SUGGESTION


          ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
          | ・ #{name}ってタイポしてにゃい？
          | ・ requireが必要じゃにゃいかな？
          ╰━ｖ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
          🐈"


        SUGGESTION
      when TypeError
        <<~SUGGESTION


          ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
          | 期待しにゃい型がメソッドの引数に渡されているﾆｬｰ
          ╰━ｖ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
          😿


        SUGGESTION
      when ArgumentError
        <<~SUGGESTION


          ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
          | ・引数の数が違うﾆｬﾝ？
          | ・メソッドに渡した値は期待したものかﾆｬﾝ？
          ╰━ｖ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
          ✨😼✨


        SUGGESTION
      when ZeroDivisionError
        <<~SUGGESTION


          ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
          | 0で除算するとこのエラーが発生するニャン
          ╰━ｖ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
          🙀🙀🙀


        SUGGESTION
      end
    end

    def message
      if self
        error_type = self
        puts "\e[31m#{self}\e[0m"
        output_message(error_type)
      else
        super
      end
    end
  end
  Exception.prepend(ExceptionJp)
end
