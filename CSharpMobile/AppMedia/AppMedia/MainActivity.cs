using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppMedia
{
    // Mostrar a média aritmética entre 3 números passados pelo usuário.

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARANDO OS COMPONENTES DO FRONT
        EditText txtN1;
        EditText txtN2;
        EditText txtN3;
        Button btnCalculaMedia;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIA DOS COMPONENTES
            txtN1 = FindViewById<EditText>(Resource.Id.txtN1);
            txtN2 = FindViewById<EditText>(Resource.Id.txtN2);
            txtN3 = FindViewById<EditText>(Resource.Id.txtN3);
            btnCalculaMedia = FindViewById<Button>(Resource.Id.btnCalculaMedia);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO DE CLICK PARA O BUTTON
            btnCalculaMedia.Click += BtnCalculaMedia_Click;
        }

        private void BtnCalculaMedia_Click(object sender, System.EventArgs e)
        {
            double n1, n2, n3, media;
            n1 = double.Parse(txtN1.Text);
            n2 = double.Parse(txtN2.Text);
            n3 = double.Parse(txtN3.Text);
            media = (n1 + n2 + n3) / 3;
            lblRes.Text = media.ToString(); 
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}