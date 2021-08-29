using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppFahrenheit
{
    /*
        Faça um algoritmo que leia uma temperatura em graus Celsius e apresente-a convertida em graus Fahrenheit. 
        A fórmula de conversão é F=(9 * C + 160) /5, na qual F é a temperatura em Fahrenheit e C é a temperatura em Celsius.
     */

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARAR COMPONENTES DO FRONT
        EditText txtCelcius;
        Button btnConverte;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIAS DOS COMPONENTES
            txtCelcius = FindViewById<EditText>(Resource.Id.txtCelsius);
            btnConverte = FindViewById<Button>(Resource.Id.btnConverte);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO PARA O BUTTON
            btnConverte.Click += BtnConverte_Click;    
        }

        private void BtnConverte_Click(object sender, System.EventArgs e)
        {
            int tempF, tempC;
            tempC = int.Parse(txtCelcius.Text);
            tempF = (9 * tempC + 160) / 5;
            lblRes.Text = ("Em graus Fahrenheit : ") + tempF.ToString();
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}