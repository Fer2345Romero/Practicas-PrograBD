namespace UI
{
	partial class Form1
	{
		/// <summary>
		///  Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		///  Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		///  Required method for Designer support - do not modify
		///  the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			label1 = new Label();
			dgvAutos = new DataGridView();
			btnExportar = new Button();
			((System.ComponentModel.ISupportInitialize)dgvAutos).BeginInit();
			SuspendLayout();
			// 
			// label1
			// 
			label1.AutoSize = true;
			label1.Font = new Font("Impact", 14.25F, FontStyle.Italic, GraphicsUnit.Point, 0);
			label1.Location = new Point(272, 21);
			label1.Name = "label1";
			label1.Size = new Size(143, 23);
			label1.TabIndex = 0;
			label1.Text = "LISTADO DE AUTOS";
			// 
			// dgvAutos
			// 
			dgvAutos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
			dgvAutos.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			dgvAutos.Location = new Point(12, 63);
			dgvAutos.Name = "dgvAutos";
			dgvAutos.Size = new Size(664, 292);
			dgvAutos.TabIndex = 1;
			// 
			// btnExportar
			// 
			btnExportar.Location = new Point(295, 374);
			btnExportar.Name = "btnExportar";
			btnExportar.Size = new Size(75, 23);
			btnExportar.TabIndex = 2;
			btnExportar.Text = "Exportar";
			btnExportar.UseVisualStyleBackColor = true;
			btnExportar.Click += btnExportar_Click;
			// 
			// Form1
			// 
			AutoScaleDimensions = new SizeF(7F, 15F);
			AutoScaleMode = AutoScaleMode.Font;
			ClientSize = new Size(688, 409);
			Controls.Add(btnExportar);
			Controls.Add(dgvAutos);
			Controls.Add(label1);
			Name = "Form1";
			Text = "Form1";
			((System.ComponentModel.ISupportInitialize)dgvAutos).EndInit();
			ResumeLayout(false);
			PerformLayout();
		}

		#endregion

		private Label label1;
		private DataGridView dgvAutos;
		private Button btnExportar;
	}
}
