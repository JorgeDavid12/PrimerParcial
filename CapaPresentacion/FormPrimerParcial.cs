using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;

namespace CapaPresentacion
{
    public partial class FormPrimerParcial: Form
    {
        CDEmpleados cdEmpleados = new CDEmpleados();


        public FormPrimerParcial()
        {
            InitializeComponent();
        }

        public void MtdMostrarEmp()
        {
            DataTable dtMostrarEmp = cdEmpleados.MtMostrarEmp();
            dgvEmpleado.DataSource = dtMostrarEmp;
        }

        private void FormPrimerParcial_Load(object sender, EventArgs e)
        {
            MtdMostrarEmp();
        }
    }
}
