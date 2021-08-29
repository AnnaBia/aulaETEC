using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;

namespace AppSalario
{
    /*
        Faça um algoritmo que:
        a) Obtenha o valor para a variável HT(horas trabalhadas no mês);
        b) Obtenha o valor para a variável VH(valor hora trabalhada);
        c) Obtenha o valor para a variável PD(percentual de desconto);
        d) Calcule o salário bruto => SB = HT * VH;
        e) Calcule o total de desconto => TD = (PD/100) * SB;
        f) Calcule o salário líquido => SL = SB - TD;
        g) Apresente os valores de : Horas trabalhadas, Salário Bruto, Desconto, Salário Líquido.
     */

    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //DECLARANDO COMPONENTES DO FRONT
        EditText txtHorasTrab;
        EditText txtValorHora;
        EditText txtPercentual;
        Button btnCalcula;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //CRIANDO INSTANCIAS DOS COMPONENTES
            txtHorasTrab = FindViewById<EditText>(Resource.Id.txtHorasTrab);
            txtValorHora = FindViewById<EditText>(Resource.Id.txtValorHora);
            txtPercentual = FindViewById<EditText>(Resource.Id.txtPercentual);
            btnCalcula = FindViewById<Button>(Resource.Id.btnCalcula);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //CRIANDO UM EVENTO PARA O BUTTON
            btnCalcula.Click += BtnCalcula_Click;
        }

        private void BtnCalcula_Click(object sender, System.EventArgs e)
        {
            double salarioBruto,valorHora,totalDesconto,salarioLiquido,percentualDesconto;
            int horasTrabalhadas;  

            valorHora = double.Parse(txtValorHora.Text);
            horasTrabalhadas = int.Parse(txtHorasTrab.Text);
            percentualDesconto = double.Parse(txtPercentual.Text);

            salarioBruto = horasTrabalhadas * valorHora;
            totalDesconto = (percentualDesconto/100) * salarioBruto;
            salarioLiquido = salarioBruto - totalDesconto;

            lblRes.Text = ("Horas Trabalhadas : ") + horasTrabalhadas.ToString() +
                ("\nSalário Bruto : R$") + salarioBruto.ToString() +
                ("\nTotal de descontos = R$") + totalDesconto.ToString() +
                ("\nSalário Líquido : R$") + salarioLiquido.ToString();
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}