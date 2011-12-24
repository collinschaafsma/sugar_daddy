module SugarDaddy::Random

  def self.token(bytes = 64)
    SecureRandom.base64(bytes)
  end

end
