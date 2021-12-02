using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using AndroidX.AppCompat.App;
using Java.Lang;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Android.Graphics;

namespace AppJokenpo
{
    [Activity(Label = "JogoActivity")]
    public class JogoActivity : Activity
    {
        // Atributos
        ImageButton btnPedra, btnPapel, btnTesoura, btnJogador, btnBot;
        TextView txtResultado, txtPlacarJogador, txtPlacarBot;
        int jogadorPontos, botPontos;
        
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.telaJogo);

            // Instâncias
            btnPedra = FindViewById<ImageButton>(Resource.Id.btnPedra);
            btnPapel = FindViewById<ImageButton>(Resource.Id.btnPapel);
            btnTesoura = FindViewById<ImageButton>(Resource.Id.btnTesoura);
            btnJogador = FindViewById<ImageButton>(Resource.Id.btnJogador);
            btnBot = FindViewById<ImageButton>(Resource.Id.btnBot);
            txtResultado = FindViewById<TextView>(Resource.Id.txtResultado);
            txtPlacarJogador = FindViewById<TextView>(Resource.Id.txtPlacarJogador);
            txtPlacarBot = FindViewById<TextView>(Resource.Id.txtPlacarBot);

            // Evento click button Jogador
            btnPedra.Click += BtnPedra_Click;
            btnPapel.Click += BtnPapel_Click;
            btnTesoura.Click += BtnTesoura_Click;
        }

        private void BtnTesoura_Click(object sender, EventArgs e)
        {
            btnJogador.SetImageResource(Resource.Drawable.tesoura2);
            EscolhaJogador(valorEscolhidoUsuario: "tesoura");
        }

        private void BtnPapel_Click(object sender, EventArgs e)
        {
            btnJogador.SetImageResource(Resource.Drawable.papel);
            EscolhaJogador(valorEscolhidoUsuario: "papel");
        }

        private void BtnPedra_Click(object sender, EventArgs e)
        {
            btnJogador.SetImageResource(Resource.Drawable.pedra);
            EscolhaJogador(valorEscolhidoUsuario: "pedra");
        }

        public void EscolhaJogador(string valorEscolhidoUsuario)
        {
            // Opções Bot aleatórias
            int numeroAleatorio = new Random().Next(3);
            string[] opcoes = { "pedra", "papel", "tesoura" };

            string opcoesBot = opcoes[numeroAleatorio];

            switch (opcoesBot)
            {
                case "pedra":
                    btnBot.SetImageResource(Resource.Drawable.pedra);
                    break;
                case "papel":
                    btnBot.SetImageResource(Resource.Drawable.papel);
                    break;
                case "tesoura":
                    btnBot.SetImageResource(Resource.Drawable.tesoura2);
                    break;
            }

            // Compara escolhas Jogador c/ escolhas aleatórias do Bot e retorna o resultado da jogada
            if ((valorEscolhidoUsuario == "tesoura" && opcoesBot == "pedra") ||
                (valorEscolhidoUsuario == "pedra" && opcoesBot == "papel") ||
                (valorEscolhidoUsuario == "papel" && opcoesBot == "tesoura"))
            {
                txtResultado.Text = "Você perdeu! :(";
                botPontos++; txtPlacarBot.Text = "" + botPontos.ToString();
            }
            else if ((valorEscolhidoUsuario == "pedra" && opcoesBot == "tesoura") ||
                (valorEscolhidoUsuario == "papel" && opcoesBot == "pedra") ||
                (valorEscolhidoUsuario == "tesoura" && opcoesBot == "papel"))
            {
                txtResultado.Text = "Você ganhou! :)";
                jogadorPontos++; txtPlacarJogador.Text = "" + jogadorPontos.ToString();
            }
            else
            {
                txtResultado.Text = "Empatou :|";
            }

            // Resultado final do jogo - indica quem venceu
            if (jogadorPontos == 3)
            {
                txtResultado.Text = "VOCÊ VENCEU MELHOR DE 3!";
                btnPedra.Enabled = false;
                btnPapel.Enabled = false;
                btnTesoura.Enabled = false;
            }
            else if (botPontos == 3)
            {
                txtResultado.Text = "BOT GANHOU MELHOR DE 3!";
                btnPedra.Enabled = false;
                btnPapel.Enabled = false;
                btnTesoura.Enabled = false;
            }
        }   
    }
}
