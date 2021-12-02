using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Widget;
using AndroidX.AppCompat.App;
using Android.Webkit;

namespace AppJokenpo
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        // Atributos
        Button btnJogar;
        Button btnRegras;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            // Fundo tela Menu - 1ª tela
            var iv = FindViewById<ImageView>(Resource.Id.imageView1);
            iv?.SetImageResource(Resource.Drawable.Menu);

            // Instâncias
            btnJogar = FindViewById<Button>(Resource.Id.btnJogar);
            btnRegras = FindViewById<Button>(Resource.Id.btnRegras);

            // Evento click button
            btnJogar.Click += BtnJogar_Click; ;
            btnRegras.Click += BtnRegras_Click;
        }

        private void BtnRegras_Click(object sender, System.EventArgs e)
        {
            // Leva para tela Jogo
            StartActivity(typeof(RegrasActivity));

            //Intent tela3 = new Intent(this, RegrasActivity.class);
            //StartActivity(tela3);
        }

        private void BtnJogar_Click(object sender, System.EventArgs e)
        {
            // Leva para tela Regras
            StartActivity(typeof(JogoActivity));

            //Intent tela2 = new Intent(this, JogoActivity.class);
            //StartActivity(tela2);
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}