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
        <<~EOS

          🧐もしかして:
            - #{name}という名前のメソッドは存在しないかも？
            - #{name}を呼び出したけど、レシーバがnilかも？
        EOS
      when NameError
        <<~EOS

          🧐もしかして:
            - #{name}がタイポかも？
            - 必要なrequireを忘れているかも？
        EOS
      when TypeError
        <<~EOS

          🧐期待していない型がメソッドの引数に渡されているかも？
        EOS
      when ArgumentError
        <<~EOS

          🧐もしかして:
            - メソッドの引数の数が違うかも？
            - メソッドに渡した値が期待した値ではないかも？
        EOS
      when ZeroDivisionError
        <<~EOS

          🧐0で除算した場合にこのエラーが発生するよ
        EOS
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
