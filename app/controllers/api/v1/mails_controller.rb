class Api::V1::MailsController < Api::V1::ApiController

  def create
    mail_id_created = Mails.build(params)
    response = mail_id_created ? {message: "Mail Created with id: #{mail_id_created}" } : {message: 'Request fail'} 
    render json: response.to_json
  end

  def index
      render json: Mails.gather_all.to_json
  end

  def show
    render json: Mails.fetch_show(params).to_json
  end

  def send_msg
    render json: Mailguns.send_message(params)
  end

  def delete
    Mail.find_by(id: params[:id]).destroy
  end

  private

    def mail_params
        params.require(:mail).permit(:subject, :to, :from, :template_id)
    end
end
