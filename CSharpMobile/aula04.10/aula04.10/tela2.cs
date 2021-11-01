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

namespace aula04._10
{
    [Activity(Label = "tela2")]
    public class tela2 : Activity
    {
        // Variáveis
        TextView lblNome, lblEndereco, lblTelefone;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            // Faz a ligação do back com o front
            SetContentView(Resource.Layout.tela2);
            lblNome = FindViewById<TextView>(Resource.Id.lblNome);
            lblEndereco = FindViewById<TextView>(Resource.Id.lblEndereco);
            lblTelefone = FindViewById <TextView>(Resource.Id.lblTelefone);

            // Recuperando os valores passados na primeira tela
            if (Intent.GetStringExtra("nome") != null)
                lblNome.Text = Intent.GetStringExtra("nome").ToString();

            if (Intent.GetStringExtra("endereco") != null)
                lblEndereco.Text = Intent.GetStringExtra("endereco").ToString();

            if (Intent.GetStringExtra("telefone") != null)
                lblTelefone.Text = Intent.GetStringExtra("telefone").ToString();
        }
    }
}