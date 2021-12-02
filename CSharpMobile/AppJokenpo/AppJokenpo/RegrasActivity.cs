using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppJokenpo
{
    [Activity(Label = "RegrasActivity")]
    public class RegrasActivity : Activity
    {
        TextView txtLink;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            // Create your application here
            SetContentView(Resource.Layout.telaRegras);

            // Fundo tela Regras - 3ª tela
            var iv = FindViewById<ImageView>(Resource.Id.imageView1);
            iv?.SetImageResource(Resource.Drawable.Regras);

            // Intâncias
            TextView txtLink = FindViewById<TextView>(Resource.Id.txtLink);

            // Evento click
            txtLink.Click += TxtLink_Click;
        }
        private void TxtLink_Click(object sender, EventArgs e)
        {
            // Abre uma página no navegador
            Intent intent = new Intent(Intent.ActionView, Android.Net.Uri.Parse("https://segredosdomundo.r7.com/como-ganhar-no-pedra-papel-e-tesoura-a-ciencia-explica/"));
            StartActivity(intent);
        }
    }
}