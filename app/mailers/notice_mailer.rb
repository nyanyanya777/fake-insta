class NoticeMailer < ApplicationMailer

def sendmail_photo(photo)
@photos = photo

  mail to: "yuryuri1477@gmail.com",
  subject: '写真が投稿されました'
    end
end
