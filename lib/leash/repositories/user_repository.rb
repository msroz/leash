class UserRepository < Hanami::Repository

  def create_with_credentials(password_plain:, email:, name: nil)
    password_digest = generate_digest(password_plain)

    create(
      name: email,
      email: email,
      password_digest: password_digest,
    )
  end

  private
    def generate_digest(password_plain)
      BCrypt::Password.create(password_plain)
    end

    def secure_compare(stored_password_digegst, password_plain)
      !!(BCrypt::Password.new(stored_password_digegst) == password_plain)
    end
end
