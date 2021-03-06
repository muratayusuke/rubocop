# encoding: utf-8

module Rubocop
  module Cop
    module Style
      class FavorPercentR < Cop
        MSG = 'Use %r for regular expressions matching more ' +
          "than one '/' character."

        def on_regexp(node)
          if node.loc.begin.is?('/') &&
              node.loc.expression.source[1...-1].scan(/\//).size > 1
            add_offence(:convention, node.loc.expression, MSG)
          end

          super
        end
      end
    end
  end
end
