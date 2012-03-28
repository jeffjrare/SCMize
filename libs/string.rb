class String
  def is_numeric?
      !!Float(self) rescue false
  end

  def permalink
    self.downcase.gsub(/\s+/, '-').gsub(/[^a-zA-Z0-9_-]+/, '')
  end
end
