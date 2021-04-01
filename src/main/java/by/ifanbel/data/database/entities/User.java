package by.ifanbel.data.database.entities;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.persistence.*;

//@Component
@Configurable(preConstruction = true, autowire = Autowire.BY_NAME, dependencyCheck = true)
@Entity
@Table(name = "registered_users")
public class User {

	@Enumerated(EnumType.STRING)
	public UserRole role;

	@Autowired
	@Transient
	PasswordEncoder passwordEncoder22;

	@Id
	@Column(name = "login", nullable = false)
	private String login;

	private String password;

	private String email;


	public User(String login, String password, String email, String role, boolean encodePassword) {
		this.login = login;
		if (encodePassword) this.password = passwordEncoder22.encode(password);
		else this.password = password;
		this.email = email;
		this.role = UserRole.getUserRole(role);
	}

	public User() {
	}

	public String getLogin() {
		return login;
	}

	public String getPassword() {
		return password;
	}

	public UserRole getRole() {
		return role;
	}

	public String getUsername() {return getLogin();}

	public String getEmail() {
		return email;
	}

	public enum UserRole {
		ROLE_SUPERADMIN,
		ROLE_ADMIN,
		ROLE_USER,
		ROLE_BANNED;

		UserRole() {
		}

		static UserRole getUserRole(String role) {
			for (UserRole userRole : UserRole.values()) {
				if (userRole.name()
						.toLowerCase()
						.contains(role.trim()
								.toLowerCase())) return userRole;
			}
			return UserRole.ROLE_BANNED;
		}
	}
}
