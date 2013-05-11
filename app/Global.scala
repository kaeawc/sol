import play.api._
import play.api.mvc._
import play.api.mvc.Results._

object Global extends WithFilters {
 
	override def onStart(app: Application) = Logger.info("App Started")
	override def onStop(app: Application) = Logger.info("App Stopped")
	override def onError(request: RequestHeader, ex: Throwable) = InternalServerError(views.html.errors.internalerror(Option(ex)))
	override def onHandlerNotFound(request: RequestHeader): Result = NotFound(views.html.errors.notfound())
	override def onBadRequest(request: RequestHeader, error: String) = BadRequest(views.html.errors.badrequest())
	override def onRouteRequest(request: RequestHeader) = {
		if(isRequestSecure(request)) super.onRouteRequest(request)
		else Option(Action{redirectToHttps(request)})
	}

	def isRequestSecure(request:RequestHeader):Boolean = {
		if(isLocal(request)) return true
		if(isHealthCheck(request)) return true
		val forwarded = request.headers.get("X-Forwarded-Proto")
		return (forwarded.isEmpty == false && forwarded.get == "https")
	}

	def isHealthCheck(request:RequestHeader):Boolean = {
		val userAgent = request.headers.get("User-Agent")
		return (userAgent.isEmpty == false && userAgent.get == "ELB-HealthChecker/1.0")
	}

	def isLocal(request:RequestHeader):Boolean = {
		val domain = request.domain
		return (domain.contains("localhost") || domain.contains(".local"))
	}
	
	def redirectToHttps(request: RequestHeader) = {
		val target = Play.current.configuration.getString("https.baseUrl").get + request.path
		MovedPermanently(target)
	}
}
