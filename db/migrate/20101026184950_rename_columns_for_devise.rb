class RenameColumnsForDevise < SolidusSupport::Migration[4.2]
  def up
    if column_exists?(:spree_users, :crypted_password)
      rename_column :spree_users, :crypted_password, :encrypted_password
    end

    if column_exists?(:spree_users, :salt)
      rename_column :spree_users, :salt, :password_salt
    elsif !column_exists?(:spree_users, :password_salt)
      add_column :spree_users, :password_salt, :string
    end

    if column_exists?(:spree_users, :remember_token_expires_at)
      if column_exists?(:spree_users, :remember_created_at)
        remove_column :spree_users, :remember_token_expires_at
      else
        rename_column :spree_users, :remember_token_expires_at, :remember_created_at
      end
    end

    if column_exists?(:spree_users, :login_count)
      if column_exists?(:spree_users, :sign_in_count)
        remove_column :spree_users, :login_count
      else
        rename_column :spree_users, :login_count, :sign_in_count
      end
    end

    if column_exists?(:spree_users, :failed_login_count)
      if column_exists?(:spree_users, :failed_attempts)
        remove_column :spree_users, :failed_login_count
      else
        rename_column :spree_users, :failed_login_count, :failed_attempts
      end
    end

    if column_exists?(:spree_users, :single_access_token)
      if column_exists?(:spree_users, :reset_password_token)
        remove_column :spree_users, :single_access_token
      else
        rename_column :spree_users, :single_access_token, :reset_password_token
      end
    end

    if column_exists?(:spree_users, :current_login_at)
      if column_exists?(:spree_users, :current_sign_in_at)
        remove_column :spree_users, :current_login_at
      else
        rename_column :spree_users, :current_login_at, :current_sign_in_at
      end
    end

    if column_exists?(:spree_users, :last_login_at)
      if column_exists?(:spree_users, :last_sign_in_at)
        remove_column :spree_users, :last_login_at
      else
        rename_column :spree_users, :last_login_at, :last_sign_in_at
      end
    end

    if column_exists?(:spree_users, :current_login_ip)
      if column_exists?(:spree_users, :current_sign_in_ip)
        remove_column :spree_users, :current_login_ip
      else
        rename_column :spree_users, :current_login_ip, :current_sign_in_ip
      end
    end

    if column_exists?(:spree_users, :last_login_ip)
      if column_exists?(:spree_users, :last_sign_in_ip)
        remove_column :spree_users, :last_login_ip
      else
        rename_column :spree_users, :last_login_ip, :last_sign_in_ip
      end
    end

    unless column_exists?(:spree_users, :authentication_token)
      add_column :spree_users, :authentication_token, :string
    end

    unless column_exists?(:spree_users, :unlock_token)
      add_column :spree_users, :unlock_token, :string
    end

    unless column_exists?(:spree_users, :locked_at)
      add_column :spree_users, :locked_at, :datetime
    end

    if column_exists?(:spree_users, :openid_identifier)
      remove_column :spree_users, :openid_identifier
    end
  end

  def down
    remove_column :spree_users, :authentication_token
    remove_column :spree_users, :locked_at
    remove_column :spree_users, :unlock_token
    rename_column :spree_users, :last_sign_in_ip, :last_login_ip
    rename_column :spree_users, :current_sign_in_ip, :current_login_ip
    rename_column :spree_users, :last_sign_in_at, :last_login_at
    rename_column :spree_users, :current_sign_in_at, :current_login_at
    rename_column :spree_users, :reset_password_token, :single_access_token
    rename_column :spree_users, :failed_attempts, :failed_login_count
    rename_column :spree_users, :sign_in_count, :login_count
    rename_column :spree_users, :remember_created_at, :remember_token_expires_at
    rename_column :spree_users, :password_salt, :salt
    rename_column :spree_users, :encrypted_password, :crypted_password
    add_column :spree_users, :unlock_token, :string
    add_column :spree_users, :openid_identifier, :string
  end
end
