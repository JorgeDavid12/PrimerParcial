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

        private void mtdLimpiarTextBoxes(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Clear();
                }
                else if (c is ComboBox)
                {
                    ((ComboBox)c).SelectedIndex = -1;
                    ((ComboBox)c).Text = string.Empty;
                }
                else if (c.HasChildren)
                {
                    mtdLimpiarTextBoxes(c);
                }
            }
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

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {

                int codigo = int.Parse(txtID.Text);
                string nombre = txtNombre.Text;
                string apellido = txtApellido.Text;
                DateTime fechaNac = DateTime.Parse(txtFecNac.Text);
                DateTime fechaCon = DateTime.Parse(txtFechContratacion.Text);
                int DepartamentoID = int.Parse(txtDepartamentoID.Text);
                string PuestoTra = txtPuestoTra.Text;
                decimal Salario = decimal.Parse(txtSalario.Text);
                string estado = cmbEstado.Text;

                int vCantidadRegistros = cdEmpleados.CP_mtdActualizarEmp(codigo, nombre, apellido, fechaNac, fechaCon, DepartamentoID, PuestoTra, Salario, estado);
                MtdMostrarEmp();
                MessageBox.Show("El empleado se actualizo con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                int codigo = int.Parse(txtID.Text);
                int vCantidadRegistros = cdEmpleados.CP_mtdEliminarEmp(codigo);
                MtdMostrarEmp();
                MessageBox.Show("Registro Eliminado!!", "Correcto!!", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {

                MessageBox.Show("No se encontró codigo!!", "Error eliminacion", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            mtdLimpiarTextBoxes(this);
        }
    }
}
