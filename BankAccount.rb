class BankAccount

  attr_accessor :deposit, :balance, :withdraw , :put_balance , :amount, :new_amount, :gain_interest

  def initialize(amount)
    @balance = amount
  end

  def put_balance
    puts "#{@balance}"
  end

  def deposit(new_amount)
    @balance = @balance + new_amount
  end

  def withdraw(new_amount)
    @balance = @balance - new_amount
  end

  def gain_interest
    intrest = 0.025 * @balance
    @balance = intrest + @balance
  end

  end
