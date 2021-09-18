using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ProcurandoExibindoDados
{
    public partial class Form2 : Form
    {
        string strconn = ConfigurationManager.ConnectionStrings["SqlServerCadastro"].ConnectionString;
        //declara um dataset privado que armazena os detalhes 
        //que serão armazenados no dataset public dsGetDetalhes 
        private DataSet dsDetalhesClientes; 

        public DataSet dsGetDetalhes
        {
            get
            {
                return dsDetalhesClientes;
            }
            set
            {
                dsDetalhesClientes = value;
            }
        }

        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            GetClientesForm1(); //chama a função
        }

        private void GetClientesForm1() //exibe detalhes dos clientes
        {
            string strconn = ConfigurationManager.ConnectionStrings["SqlServerCadastro"].ConnectionString;
            try
            {
                txtID.Text = dsDetalhesClientes.Tables[0].Rows[0]["id"].ToString();
                txtNome.Text = dsDetalhesClientes.Tables[0].Rows[0]["nome"].ToString();
                txtEndereco.Text = dsDetalhesClientes.Tables[0].Rows[0]["endereco"].ToString();
                txtTelefone.Text = dsDetalhesClientes.Tables[0].Rows[0]["telefone"].ToString();
                txtEmail.Text = dsDetalhesClientes.Tables[0].Rows[0]["email"].ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLimpar_Click(object sender, EventArgs e)
        {
            txtID.Clear();
            txtNome.Clear();
            txtEndereco.Clear();
            txtTelefone.Clear();
            txtEmail.Clear();
        }

       private void btnInserir_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNome.Text) || string.IsNullOrEmpty(txtEndereco.Text) || string.IsNullOrEmpty(txtTelefone.Text) || string.IsNullOrEmpty(txtEmail.Text))
            {
                MessageBox.Show("Preencha todos os dados", "Inserir", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            SqlConnection sqlconn = new SqlConnection(strconn); // string de conexão
            try
                {
                    sqlconn.Open();
                    SqlCommand cmdInsereCliente = new SqlCommand("inserirCliente", sqlconn);
                    cmdInsereCliente.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmdInsereCliente); //feita na execução do comando
                    DataSet dsClientes = new DataSet(); //recebe os dados e retorna o comando

                    da.SelectCommand.Parameters.AddWithValue("@NOME", SqlDbType.VarChar).Value = txtNome.Text.Trim();
                    da.SelectCommand.Parameters.AddWithValue("@ENDERECO", SqlDbType.VarChar).Value = txtEndereco.Text.Trim();
                    da.SelectCommand.Parameters.AddWithValue("@TELEFONE", SqlDbType.VarChar).Value = txtTelefone.Text.Trim();
                    da.SelectCommand.Parameters.AddWithValue("@EMAIL", SqlDbType.VarChar).Value = txtEmail.Text.Trim();
                    da.Fill(dsClientes);

                    MessageBox.Show("Cliente inserido com sucesso", "Inserir", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro : " + ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    sqlconn.Close();
                }
        }

        private void btnAlterar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNome.Text) || string.IsNullOrEmpty(txtEndereco.Text) || string.IsNullOrEmpty(txtTelefone.Text) || string.IsNullOrEmpty(txtEmail.Text))
            {
                MessageBox.Show("Digite os dados para alteração", "Alterar", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            SqlConnection sqlconn = new SqlConnection(strconn); // string de conexão
            try
            {
                sqlconn.Open();
                SqlCommand cmdAtualizarCliente = new SqlCommand("atualizarCliente", sqlconn);
                cmdAtualizarCliente.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmdAtualizarCliente); //feita na execução do comando
                DataSet dsClientes = new DataSet(); //recebe os dados e retorna o comando

                da.SelectCommand.Parameters.AddWithValue("@ID", SqlDbType.Int).Value = int.Parse(txtID.Text.Trim());
                da.SelectCommand.Parameters.AddWithValue("@NOME", SqlDbType.VarChar).Value = txtNome.Text.Trim();
                da.SelectCommand.Parameters.AddWithValue("@ENDERECO", SqlDbType.VarChar).Value = txtEndereco.Text.Trim();
                da.SelectCommand.Parameters.AddWithValue("@TELEFONE", SqlDbType.VarChar).Value = txtTelefone.Text.Trim();
                da.SelectCommand.Parameters.AddWithValue("@EMAIL", SqlDbType.VarChar).Value = txtEmail.Text.Trim();
                da.Fill(dsClientes);

                MessageBox.Show("Alterado com sucesso", "Alterar", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro : " + ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                sqlconn.Close();
            }
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            SqlConnection sqlconn = new SqlConnection(strconn); // string de conexão
            try
            {
                sqlconn.Open();
                SqlCommand cmdAtualizarCliente = new SqlCommand("excluirCliente", sqlconn);
                cmdAtualizarCliente.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmdAtualizarCliente); //feita na execução do comando
                DataSet dsClientes = new DataSet(); //recebe os dados e retorna o comando

                da.SelectCommand.Parameters.AddWithValue("@ID", SqlDbType.Int).Value = int.Parse(txtID.Text.Trim());
                da.Fill(dsClientes);

                MessageBox.Show("Excluído com sucesso", "Excluir", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro : " + ex.Message, "Erro", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                sqlconn.Close();
            }
        }
    }
 }

