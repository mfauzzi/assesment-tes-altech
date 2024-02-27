class SendEmailJob < ApplicationJob
    queue_as :default
    
    def perform(user)
        user = User.find(user_id)
        book = Book.find(book_id)
    end
end