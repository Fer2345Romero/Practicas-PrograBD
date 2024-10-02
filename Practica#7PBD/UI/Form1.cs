using ClosedXML.Excel;
using DataLayer.Repositories;

namespace UI
{
	public partial class Form1 : Form
	{
		private CarHubRepository _carhubRepository;

		public Form1()
		{
			InitializeComponent();

			_carhubRepository = new CarHubRepository();
			loadCars();
		}

		public void loadCars()
		{
			dgvAutos.DataSource = _carhubRepository.GetCars();
		}

		private void btnExportar_Click(object sender, EventArgs e)
		{
			using (var workbook = new XLWorkbook())
			{
				var wordksheet = workbook.Worksheets.Add("Cars");
				wordksheet.Cell("A1").InsertTable(_carhubRepository.GetCars());

				workbook.SaveAs(@"C:\Users\Williams\Desktop\Practica 7 POE\Practica#7PBD\Export\carshub.xlsx");
			}
		}
	}
}
