using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppDadosRetangulo
{
    /*
        Entre com a base e a altura de um retângulo e mostre os resultados:
        a. Perímetro(Perímetro é igual á soma dos 4 lados)
        b. Área(Área é igual à lado vezes lado)
     */

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARAR OS COMPONENTES PROGRAMÁVEIS QUE ESTÃO NO FRONT
        EditText txtN1;
        EditText txtN2;
        Button btnCalcular;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIAS DOS COMPONENTES
            txtN1 = FindViewById<EditText>(Resource.Id.txtN1);
            txtN2 = FindViewById<EditText>(Resource.Id.txtN2);
            btnCalcular = FindViewById<Button>(Resource.Id.btnCalcula);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO DE CLICK PARA O BUTTON
            btnCalcular.Click += BtnCalcular_Click;
        }

        private void BtnCalcular_Click(object sender, System.EventArgs e)
        {
            double n1, n2,per,area;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            per = (n1 + n2) * 2;
            area = n1 * n2;

            lblRes.Text = ("Perímetro : ") + per.ToString() + ("cm\nÁrea : ") + area.ToString() + ("cm");
        }
        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}