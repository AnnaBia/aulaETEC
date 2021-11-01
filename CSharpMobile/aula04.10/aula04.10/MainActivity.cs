using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget; // para chamar as variáveis
using Android.Content;


namespace aula04._10
{
    [Activity(Label = "passandoValores", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        // Variáveis
        EditText txtNome, txtEndereco, txtTelefone;
        Button btnOK;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            txtNome = FindViewById<EditText>(Resource.Id.txtNome);
            txtEndereco = FindViewById<EditText>(Resource.Id.txtEndereco);
            txtTelefone = FindViewById<EditText>(Resource.Id.txtTelefone);

            btnOK = FindViewById<Button>(Resource.Id.btnOK);

            // Evento do buttom
            btnOK.Click += BtnOK_Click;
        }

        private void BtnOK_Click(object sender, System.EventArgs e)
        {
            // Instância de uma nova Intent
            Intent novaTela = new Intent(this, typeof(tela2));

            // Adicionando os valores ao método PutExtra
            novaTela.PutExtra("nome", txtNome.Text);
            novaTela.PutExtra("endereco", txtEndereco.Text);
            novaTela.PutExtra("telefone", txtTelefone.Text);
            StartActivity(novaTela); // Comando que abre uma nova tela
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}