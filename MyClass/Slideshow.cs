using project.Models;
namespace project.MyClass
{
	public class Slideshow
	{
		//lay danh sach cac ban ghi qua vi tri
		//tu khoa static co y nghia: TenClass.TenHam() ma khong can khoi tao doi tuong
		public static List<ItemSlide> GetSlide()
		{
			MyDbContext db = new MyDbContext();
			var list_record = db.Slides.OrderByDescending(item => item.Id).ToList();
			return list_record;
		}
	}
}
