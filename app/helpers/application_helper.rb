module ApplicationHelper

  ### monkey patch

  String.class_eval do
    def strip_tags
      ActionController::Base.helpers.strip_tags self
    end
  end

  ActionController::Parameters.class_eval do
    def strip_tags
      self.each do |key, value|
        self[key] = value.strip_tags
      end
      self
    end
  end
end
