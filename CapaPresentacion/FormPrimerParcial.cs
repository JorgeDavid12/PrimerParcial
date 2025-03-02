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

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                cdEmpleados.CP_mtdAgregarEmp(txtNombre.Text, txtApellido.Text, DateTime.Parse(txtFecNac.Text), DateTime.Parse(txtFechContratacion.Text), int.Parse(txtDepartamentoID.Text), txtPuestoTra.Text, decimal.Parse(txtSalario.Text), cmbEstado.Text);
                MtdMostrarEmp();
                MessageBox.Show("El empleado se agrego con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvEmpleado_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtID.Text = dgvEmpleado.SelectedCells[0].Value.ToString();
            txtNombre.Text = dgvEmpleado.SelectedCells[1].Value.ToString();
            txtApellido.Text = dgvEmpleado.SelectedCells[2].Value.ToString();
            txtFecNac.Text = dgvEmpleado.SelectedCells[3].Value.ToString();
            txtFechContratacion.Text = dgvEmpleado.SelectedCells[4].Value.ToString();
            txtDepartamentoID.Text = dgvEmpleado.SelectedCells[5].Value.ToString();
            txtPuestoTra.Text = dgvEmpleado.SelectedCells[6].Value.ToString();
            txtSalario.Text = dgvEmpleado.SelectedCells[7].Value.ToString();
            cmbEstado.Text = dgvEmpleado.SelectedCells[8].Value.ToString();
        }
    }
}
