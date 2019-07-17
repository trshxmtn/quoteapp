class InquiryMailer < ApplicationMailer
    default to: 'banjoyatakumi@gmail.com' # 送信先アドレス
 
    def received_email(inquiry)
        @inquiry = inquiry
        mail(subject: 'Quoteにお問い合わせが届きました') do |format|
        format.text
        end
    end
end
