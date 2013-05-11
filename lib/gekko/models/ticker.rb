
module Gekko
  module Models
    class Ticker

      def self.get_json(pair, redis)
        redis.get("@{pair.downcase}:ticker").callback do |ticker|
          yield ticker
        end
      end




      #      attr_accessor :id, :account, :pair, :type, :amount, :price
      #
      #      def self.parse(data)
      #        parsed = Oj.load(data)
      #        new(parsed['pair'], parsed['type'], parsed['amount'], parsed['price'])
      #      end
      #
      #      def initialize(pair, type, amount, price, account)
      #        @pair    = pair
      #        @type    = type
      #        @amount  = amount
      #        @price   = price
      #        @account = account
      #        @id      = UUID.generate
      #
      #        raise 'Orders must supply a pair'                               unless @pair
      #        raise 'Price must either be a positive integer or be omitted'   if (@price && (!@price.is_a?(Fixnum) || (@price <= 0)))
      #        raise 'Type must be either buy or sell'                         unless ['buy', 'sell'].include?(@type)
      #        raise 'Amount must either be a positive integer or be omitted'  if (@price && (!@price.is_a?(Fixnum) || (@price <= 0)))
      #        raise 'Orders must have an account'                             unless @account
      #      end
      #
      #      def to_json
      #        Oj.dump({
      #          'account' => @account,
      #          'pair'    => @pair,
      #          'amount'  => @amount,
      #          'price'   => @price,
      #          'type'    => @type,
      #          'id'      => @id
      #        })
      #      end
      #
      #      def self.find(order_id, redis)
      #        from_json(redis.get(order_id))
      #      end
      #
      #      def self.from_json(str)
      #        o = Oj.load(str)
      #        new(o['pair'], o['type'], o['amount'], o['price'], o['account'])
      #      end
    end
  end
end