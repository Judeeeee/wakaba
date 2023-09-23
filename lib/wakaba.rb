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

          🧐もしかして:
            - #{name}という名前のメソッドは存在しないかも？
            - #{name}を呼び出したけど、レシーバがnilかも？
        SUGGESTION
      when NameError
        <<~SUGGESTION

          🧐もしかして:
            - #{name}がタイポかも？
            - 必要なrequireを忘れているかも？
        SUGGESTION
      when TypeError
        <<~SUGGESTION

          🧐期待していない型がメソッドの引数に渡されているかも？
        SUGGESTION
      when ArgumentError
        <<~SUGGESTION

          🧐もしかして:
            - メソッドの引数の数が違うかも？
            - メソッドに渡した値が期待した値ではないかも？
        SUGGESTION
      when ZeroDivisionError
        <<~SUGGESTION

          🧐0で除算した場合にこのエラーが発生するよ
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
