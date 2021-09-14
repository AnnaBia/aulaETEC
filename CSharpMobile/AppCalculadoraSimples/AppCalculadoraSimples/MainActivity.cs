using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppCalculadoraSimples
{
    //Entre com dois números e crie quatro botões : soma, subtrair, multiplicar e dividir.

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARAR OS COMPONENTES PROGRAMÁVEIS QUE ESTÃO NO FRONT
        EditText txtN1, txtN2;
        Button btnSomar, btnSubtrair,btnMultiplicar,btnDividir;
        TextView lblRes;

        protected override void OnCreate(Bundle savedInstanceState) //onde programamos
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIAS DOS COMPONENTES
                    //FindView são as telas do front-end
            txtN1 = FindViewById<EditText>(Resource.Id.txtN1);
            txtN2 = FindViewById<EditText>(Resource.Id.txtN2);
            btnSomar = FindViewById<Button>(Resource.Id.btnSomar);
            btnSubtrair = FindViewById<Button>(Resource.Id.btnSubtrair);
            btnMultiplicar = FindViewById<Button>(Resource.Id.btnMultiplicar);
            btnDividir = FindViewById<Button>(Resource.Id.btnDividir);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO DE CLICK PARA O BUTTON
            btnSomar.Click += BtnSomar_Click;
            btnSubtrair.Click += BtnSubtrair_Click;
            btnMultiplicar.Click += BtnMultiplicar_Click;
            btnDividir.Click += BtnDividir_Click;
        }

        private void BtnDividir_Click(object sender, System.EventArgs e)
        {
            //throw new System.NotImplementedException(); //EM MOBILE ESSA LINHA É INDIFERENTE
            double n1, n2,res;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            res = n1 / n2;
            lblRes.Text = res.ToString();
        }

        private void BtnMultiplicar_Click(object sender, System.EventArgs e)
        {
            double n1, n2, res;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            res = n1 * n2;
            lblRes.Text = res.ToString();
        }

        private void BtnSubtrair_Click(object sender, System.EventArgs e)
        {
            double n1, n2, res;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            res = n1 - n2;
            lblRes.Text = res.ToString();
        }

        private void BtnSomar_Click(object sender, System.EventArgs e)
        {
            
            double n1, n2, res;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            res = n1 + n2;
            lblRes.Text = res.ToString("0.00");
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}