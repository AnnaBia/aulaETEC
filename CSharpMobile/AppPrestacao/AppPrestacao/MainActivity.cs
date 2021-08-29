using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppPrestacao
{
    //Calcule o valor de uma prestação em atraso, utilizando a fórmula: PRESTAÇÃO = VALOR + (VALOR * (TAXA/100)*TEMPO).

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARANDO COMPONENTES DO FRONT
        EditText txtValorInicial;
        EditText txtMesesAtraso;
        EditText txtJuros;
        Button btnCalcula;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIAS DOS COMPONENTES
            txtValorInicial = FindViewById<EditText>(Resource.Id.txtValorInicial);
            txtMesesAtraso = FindViewById<EditText>(Resource.Id.txtMesesAtraso);
            txtJuros = FindViewById<EditText>(Resource.Id.txtJuros);
            btnCalcula = FindViewById<Button>(Resource.Id.btnCalcula);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO DE CLICK PARA O BUTTON
            btnCalcula.Click += BtnCalcula_Click;
        }

        private void BtnCalcula_Click(object sender, System.EventArgs e)
        {
            double prestacaoInicial,juros,prestacaoFinal;
            int tempo;

            prestacaoInicial = double.Parse(txtValorInicial.Text);
            juros = double.Parse(txtJuros.Text);
            tempo = int.Parse(txtMesesAtraso.Text);

            prestacaoFinal = prestacaoInicial + (prestacaoInicial * (juros/100) * tempo);
            lblRes.Text = ("Valor c/ acréscimo da taxa de juros : R$") + prestacaoFinal.ToString();
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}