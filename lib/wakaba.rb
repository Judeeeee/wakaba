# frozen_string_literal: true

require_relative 'wakaba/version'

module Wakaba
  class Error < StandardError; end

  module ExceptionJp
    def message
      case self
      when NameError
        "
        \e[31m#{self}\e[0m

        🧐もしかして:
          - #{name}がタイポかも？
          - #{name}を呼び出すためのrequireを忘れているかも？
        "

      when NoMethodError
        "
        \e[31m#{self}\e[0m

        🧐もしかして:
          - #{name}という名前のメソッドは存在しないかも？
          - #{name}を呼び出したけど、レシーバがnilかも？
        "

      when TypeError
        "
        \e[31m#{self}\e[0m

        🧐期待していない型がメソッドの引数に渡されているかも？
        "
      when ArgumentError
        "
        \e[31m#{self}\e[0m

        🧐もしかして:
          - メソッドの引数の数が違うかも？
          - メソッドに渡した値が期待した値ではないかも？
        "
      when ZeroDivisionError
        "
        \e[31m#{self}\e[0m

        🧐0で除算した場合にこのエラーが発生するよ
        "
      when SystemStackerror
        "
        \e[31m#{self}\e[0m

        🧐無限ループの場合にこのエラーが発生するよ
        "
      when Loaderror
        "
        \e[31m#{self}\e[0m

        🧐もしかして:
          - requireしたいファイルのパスかライブラリ名が間違っているかも？
          - requireしたgemが実行環境にないかも？
        "
      when SyntaxError
        "
        \e[31m#{self}\e[0m

        🧐end,カンマ,括弧の数を確認してみよう
        "
      else
        super
      end
    end
  end

  Exception.prepend(ExceptionJp)
end
