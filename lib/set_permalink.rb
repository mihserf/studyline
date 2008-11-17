
module SetPermalink
  def self.included(base)
    base.class_eval do
      after_create :update_permalink
      before_update :set_permalink
      
      def set_permalink
        self.permalink = self.id if self.permalink.nil? || self.permalink == ""
      end

      def update_permalink
        update_attribute :permalink, "#{id}"  if self.permalink.nil? || self.permalink == ""
      end
    end
  end
end
