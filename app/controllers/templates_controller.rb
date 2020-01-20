class TemplatesController < ApplicationController
  before_action :set_default_instances_variables, only: [:show, :update, :destroy, :edit]

  def index
    @templates = Template.all
  end
  
  def destroy
      @template.destroy if @template
			redirect_to '#home'
  end

  def generate
    Template.generate(params[:code], params[:mail])
    redirect_to root_url, notice: "Data Imported"
  end

  def show
    redirect_to '#home' if @template.nil?
  end

  private

  def set_default_instances_variables
    @template = Template.find_by(params[:id])
  end
end
