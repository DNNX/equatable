module Equatable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def equatable(*members)
      __create_hash_method(*members)
      __create_eql_method(*members)
      alias_method :==, :eql?
    end
    
    private 
    
    def __create_hash_method(*members)
      define_method(:hash) do 
        members.reduce(0) { |xored, member| xored ^ self.__send__(member.to_sym).hash }
      end
    end
    
    def __create_eql_method(*members)
      define_method(:eql?) do |other|
        members.all? { |member| __compare_member_values(other, member) }
      end
    end
  end
  
  private

  def __compare_member_values(other, member)
    return false unless other.respond_to?(member)
    self_value = self.__send__(member)
    other_value = other.__send__(member)
    self_value.eql?(other_value)
  end
end
