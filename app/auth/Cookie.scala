package auth

import play.api.libs.Crypto
import models.User

object Cookie {

  /**
   * creates a Cookie instance with an encrypted value
   */
	def create(key:String,value:String,secure:Boolean = false, rememberMe:Boolean = false) = {
		val expires:Option[Int] = if(rememberMe) Option(31536000) else None
		play.api.mvc.Cookie(key, Crypto.encryptAES(value), expires, "/", None, secure)
	}

  /**
   * reads a RequestHeader's Cookie by the given key if it exists
   */
	def read(request:play.api.mvc.RequestHeader,key:String):String = {
		val cookie = request.cookies.get(key)
		cookie match {
			case Some(c:play.api.mvc.Cookie) => Crypto.decryptAES(c.value)
			case _ => throw new Exception("Could not read key ["+key+"] from cookie in request.")
		}
	}

  /**
   * attempts to decode the current user's cookie
   */
	def getUser(request:play.api.mvc.RequestHeader):Option[User] = {
		try {
			val userCookieKey = play.api.Play.current.configuration.getString("cookies.user.key").get
			val cookie = read(request,userCookieKey)
			val user = User.parse(cookie)
			Option(user)
		} catch {
			case e:Exception => None
		}
	}
}
