using Microsoft.AspNetCore.Mvc;

namespace project.Controllers
{
	public class AboutController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
