class Comment < DataMapper::Base
  Linguistics::use( :en )

  belongs_to :post

  property :name,       :string
  property :url,        :string
  property :email,      :string,  :lazy => false
  property :body_html,  :text,    :lazy => false
  property :body,       :text
  property :created_at, :datetime
  property :question,   :string
  property :answer,     :integer
        
  attr_accessor :given_answer #match answer before save
  validates_presence_of :name, :body, :email, :answer
  before_create :set_q_a
  before_save :check_answer
  
  private
  
  def set_q_a
    self.question, self.answer = gen_question_and_answer    
  end
  
  def gen_question_and_answer
    ops = {0 => ['plus', '+'], 1 => ['minus', '-'], 2 => ['times', '*']}
    a = rand(10)
    b = rand(10)
    op = ops[rand(3)]
    question = "What is #{a.en.numwords} #{op[0]} #{b.en.numwords}?"  
    answer = eval("#{a} #{op[1]} #{b}")
    return question, answer
  end
  
  def check_answer
    english_a = answer > 0 ? answer.en.numwords : "#minus {answer.abs.en.numwords}"
    return false unless (given_answer == answer or given_answer == english_a) 
  end

end

