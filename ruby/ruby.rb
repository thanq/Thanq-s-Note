class MegaGreeter 
	attr_accessor :names

	def initialize(names = "world")
		@names = names
	end

	def say_hi
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("each")

		@names.each do |name|
			puts "HEllo #{name}"
		end
		else
			puts "Hello #{@names} !"
		end 
	end

	def say_bye 
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("join")	
			puts "goodbye #{@names.join(",")} . come back " 
		else  
			puts "goodbye #{@names} . come back soon "
		end
	end
end

if __FILE__ == $0 
	mg = MegaGreeter.new 
	mg.say_hi 
	mg.say_bye

	mg.names=["Albert" , "brenda" , "Dave" ] 
	mg.say_hi 
	mg.say_bye

	mg.names = nil 
	mg.say_hi
	mg.say_bye 
end

	
 
ʹ�� end �ؼ���������class�ȵĶ��� ������}

require �ؼ������ import �ؼ��� 

���еĳ�Ա��������˽�е�, ���ⲿ��ͨ���������� 

��������ʱ () ��Ȼ���Բ�Ҫ 

һ�ж��Ƕ��� , ���� 1, 2.1 ������

û�о�̬���� У�� 

������ֻ�Ǳ�ǩ ����û�о�������ͺ����ǰ�

ľ���������� ֻ���ñ������� , liek : a = [1,2]
	������ : int[] a = {1,2}

û�з���������  

foo = Foo.new("hi") , ������ Foo foo = new Foo("hi");

���췽����  initialize  , ������ ��������ͬ

mixin ���� interfaces
 
YAML

nil ��� null

== ���������Ƿ���ruby�е�ֵ ,  ����java�е� equals

equal?() ���ж����������ǲ���ͬһ������ , ���� java �е� == 

__FILE__ == $0 
	�����ǰ�Ľű�����ʼ�ű� 

class Greeter 
	def initialize (name = "define" ) 
		@name = name #����ʵ������ 
		# �����е����з��� ������ʹ�� @name ���õ�
	end
end 
