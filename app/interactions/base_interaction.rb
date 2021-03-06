class BaseInteraction < ActiveInteraction::Base
  object :current_user, class: User

  def handler
    valid? ? [result, :ok] : [errors, :unprocessable_entity]
  end

  protected

  def find_resource
 		resource = yield
 		errors.add(:resource, I18n.t(:not_found)) unless resource
 		resource
  end

  private

  def merge_errors!(other_errors)
    errors.send :merge_messages!, other_errors
  end
end
