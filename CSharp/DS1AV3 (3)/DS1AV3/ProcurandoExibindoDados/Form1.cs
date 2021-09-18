using System;
using System.Data;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace ProcurandoExibindoDados
{
    public partial class Form1 : Form
    {
        string strconn = ConfigurationManager.ConnectionStrings["SqlServerCadastro"].ConnectionString;

        public Form1()
        {
            InitializeComponent();
        }
        
        private void btnProcurar_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtNome.Text))
            {
                 MessageBox.Show("O sistema não identificou a solicitação, digite novamente!", "Localizar", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            
            try
            {
                Form2 frmDetalhesClientes = new Form2();

                SqlConnection sqlconn = new SqlConnection(strconn);
                sqlconn.Open();
                SqlCommand cmdProcuraClientes = new SqlCommand("LocalizarPorNome", sqlconn);
                cmdProcuraClientes.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmdProcuraClientes);
                DataSet dsClientes = new DataSet();

                da.SelectCommand.Parameters.AddWithValue("@NOME", SqlDbType.VarChar).Value = txtNome.Text.Trim();
                da.Fill(dsClientes);

                if (dsClientes.Tables[0].Rows.Count > 0)
                {
                    frmDetalhesClientes.dsGetDetalhes = dsClientes;
                    frmDetalhesClientes.Show();
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro : " + ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

    }
}
