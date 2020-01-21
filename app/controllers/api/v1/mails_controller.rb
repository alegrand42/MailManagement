class Api::V1::MailsController < Api::V1::ApiController

  def create
    mail_id_created = Mails.gather_data(params)
    response = mail_created ? {message: mail_id_created } : {message: 'Request fail'} 
    render json: response.to_json
  end

  def index
      render json: Mails.get_all_mails_data.to_json
  end

  def show
    render json: Mails.get_mail_data(params).to_json
  end

  def status
    #render json: "OK" "SENDING" "FAIL"
  end

  private

    def mail_params
        params.require(:mail).permit(:subject, :to, :from, :template_id)
    end
end
