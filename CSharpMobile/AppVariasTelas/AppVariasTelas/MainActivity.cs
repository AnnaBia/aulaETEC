using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;
using System.Collections;

namespace AppVariasTelas
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        ArrayList formas;//Lista de itens do spinner
        ArrayAdapter adaptador;//Para vincular a lista (array) ao spinner
        Button btnConfirmar;
        string sFormas;
        ListView lstFormas;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //INSTÂNCIA DO LISTVIEW
            lstFormas = FindViewById<ListView>(Resource.Id.lstFormas)

            //INSTÂNCIA DO BUTTON
            btnConfirmar = FindViewById<Button>(Resource.Id.btnConfirmar);

            //INSTÂNCIA DO ARRAY
            formas = new ArrayList();

            //ADICIONANDO ITENS AO ARRAY
            formas.Add("Quadrado"); //posição 0
            formas.Add("Retângulo");//posição 1
            formas.Add("Círculo");//posição 2
            formas.Add("Tiângulo");//posição 3

            //instância do adapter
            adaptador = new ArrayAdapter(this,
                Android.Resource.Layout.SimpleListItem1, formas);



            //vincular o adaptador ao controle listview
            lstFormas.Adapter = adaptador;

            //Evento click do button
            btnConfirmar.Click += BtnConfirmar_Click;

            //Evento click em um item da lista
            lstFormas.ItemClick += LstFormas_ItemClick;
        }

        private void BtnConfirmar_Click(object sender, System.EventArgs e)
        {
            int item = spnEstados.SelectedItemPosition;

            switch (item)
            {
                case 0:
                    estado = "São Paulo";
                    break;
                case 1:
                    estado = "Rio de Janeiro";
                    break;
                case 2:
                    estado = "Minas Gerais";
                    break;
            }
            Toast.MakeText(this, "Estado Selecionado: " + estado, ToastLength.Short).Show();
        }

        private void LstFormas_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            throw new System.NotImplementedException();
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}