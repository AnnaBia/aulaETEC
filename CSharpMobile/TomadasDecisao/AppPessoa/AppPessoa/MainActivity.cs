using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;
using System.Collections;

namespace AppPessoa
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //CRIANDO ATRIBUTOS DO FRONT
        EditText txtAltura;
        Spinner spnSexo;
        ArrayList opcoesSexo;//Lista de itens do spinner
        ArrayAdapter adapter;//Para vincular a lista (array) ao spinner
        Button btnCalcula;
        TextView lblRes;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //INSTÂNCIAS DOS ATRIBUTOS
            txtAltura = FindViewById<EditText>(Resource.Id.txtAltura);
            spnSexo = FindViewById<Spinner>(Resource.Id.spnSexo);
            btnCalcula = FindViewById<Button>(Resource.Id.btnCalcula);
            lblRes = FindViewById<TextView>(Resource.Id.lblRes);

            //INSTANCIA DO ARRAY
            opcoesSexo = new ArrayList();

            //ADICIONANDO ITENS AO ARRAY
            opcoesSexo.Add("Masculino");
            opcoesSexo.Add("Feminino");
            opcoesSexo.Add("Outros");

            //instância do adapter
            adapter = new ArrayAdapter(this,
            Android.Resource.Layout.Simple, opcoesSexo);

            //VINDCULA O ADAPTADOR AO CONTROLE SPINNER
            spnSexo.Adapter = adapter;

            //CRIAR EVENTO PARA BUTTON
            btnCalcula.Click += BtnCalcula_Click;
        }

        private void BtnCalcula_Click(object sender, System.EventArgs e)
        {
            int sexo = spnSexo.Selectedsexo;

            switch (sexo)
            {
                case 0:
                    opcoesSexo = "Masculino";
                    break;
                case 1:
                    opcoesSexo = "Feminino";
                    break;
                case 2:
                    opcoesSexo = "Outros";
                    break;
            }
            Toast.MakeText(this, "Estado Selecionado: " + estado, ToastLength.Short).Show();
        }

        private void SpnSexo_Click(object sender, System.EventArgs e)
        {
            
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}