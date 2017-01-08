package com.packt.ship.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select name, password, login from user where name=?")
				.authoritiesByUsernameQuery(
						"select u.name, r.name from user u join user_role ur on u.id_u=ur.id_u join role r on ur.id_r=r.id_r where u.name=?");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http
		/*.authorizeRequests()
			.antMatchers("/index")
				.hasRole("USER")
		.and()*/
		.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/")
			.failureUrl("/loginfailed")
		.and()
			.csrf()
		.and()
		.rememberMe()
			.tokenValiditySeconds(20000)
			.rememberMeParameter("remember-me")
			.rememberMeCookieName("remember-me")
		.and()
		.logout()
			.logoutSuccessUrl("/logout")
			.deleteCookies("JSESSIONID, remember-me")
		.and()
		.sessionManagement()
			.invalidSessionUrl("/login")
			.maximumSessions(1)
			.expiredUrl("/login");
	}
}
