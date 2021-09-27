using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;
using System.Collections; //para chamar array

namespace AppSaude
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        // DECLARANDO VARIAVEIS DO FRONT
        ListView lstOpcoes;
        ArrayList opcoes;
        ArrayAdapter adapter;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);
            // INSTANCIAS DAS VARIAVEIS
            lstOpcoes = FindViewById<ListView>(Resource.Id.lstOpcoes);

            //INSTÂNCIA DO ARRAY
            opcoes = new ArrayList();

            //ADICIONANDO ITENS AO ARRAY
            opcoes.Add("Engordar 😋");
            opcoes.Add("Emagrecer 🤐");
            opcoes.Add("Manter o peso 😎");

            //instância do adapter
            adapter = new ArrayAdapter(this,
            Android.Resource.Layout.SimpleListItem1, opcoes);

            // VINCULA O ADAPTER A LISTVIEW
            lstOpcoes.Adapter = adapter;

            // CRIAR O EVENTO ITEM CLICK PARA O LISTVIEW
            lstOpcoes.ItemClick += LstOpcoes_ItemClick;
        }

        private void LstOpcoes_ItemClick(object sender, AdapterView.ItemClickEventArgs e) // 'e' guarda a posição do item clicado
        {
            int item = e.Position;
            switch (item)
            {
                case 0:
                    StartActivity(typeof(EmagrecerActivity));
                    break;
                case 1:
                    StartActivity(typeof(EmagrecerActivity));
                    break;
                case 2:
                    StartActivity(typeof(EmagrecerActivity));
                    break;
            }
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}