require 'phoenix/pubsub/version'
require 'erlang/etf'
require 'redis'

module Erlang
  module ETF
    module Extensions

      module Symbol
        def __erlang_type__
          if to_s.ascii_only?
            :atom
          else
            :atom_utf8
          end
        end
      end

      module Hash
        def __erlang_type__
          :map
        end

        def __erlang_evolve__
          if size == 0
            ETF::Map.new([], [])
          else
            values = flatten.map(&:__erlang_evolve__)
            ETF::Map.new(*values.each_slice(values.size/2).to_a)
          end
        end
      end

    end
  end
end


module Phoenix
  module Pubsub

    class Redis
      def initialize(redis_url: 'redis://localhost:6379', phoenix_class: 'Chat.PubSub')
        @phoenix_class_name = phoenix_class
        @redis = ::Redis.new(url: redis_url)
      end

      def publish topic, event, payload
        @redis.publish("phx:Elixir.#{@phoenix_class_name}", serialize_message(topic, event, payload))
      end

      private

      def serialize_message topic, event, payload
        term = Erlang::Tuple[
          # {@redis_msg_vsn, node_ref, pool_size, from_pid, topic, msg}
          1, '', 1, :none, topic, {
            :__struct__ => :"Elixir.Phoenix.Socket.Broadcast",
            :event => event,
            :payload => payload,
            :topic => topic
          }
        ]
        Erlang.term_to_binary term
      end
    end

  end
end
