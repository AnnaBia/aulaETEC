using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget;
using System.Collections;

namespace AppSpinnerListView
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        //CRIANDO ATRIBUTOS DO FRONT
        Spinner spnEstados;//declaração do spinner
        ArrayList estados;//Lista de itens do spinner
        ArrayAdapter adapter;//Para vincular a lista (array) ao spinner
        ListView lstEstados; //declaração da ListView
        Button btnOK;
        string estado = "";
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            //INSTÂNCIA DO SPINNER
            spnEstados = FindViewById<Spinner>(Resource.Id.spnEstados);

            //INSTÂNCIA DO BUTTON
            btnOK = FindViewById<Button>(Resource.Id.btnok);

            //INSTÂNCIA DA LISTVIEW
            lstEstados = FindViewById<ListView>(Resource.Id.lstEstados);

            //INSTÂNCIA DO ARRAY
            estados = new ArrayList();

            //ADICIONANDO ITENS AO ARRAY
            estados.Add("São Paulo");
            estados.Add("Rio de Janeiro");
            estados.Add("Minas Gerais");

            //instância do adapter
            adapter = new ArrayAdapter(this,
            Android.Resource.Layout.SimpleListItem1, estados);

            //vincula o adaptador ao controle spinner
            spnEstados.Adapter = adapter;

            //Evento de click para o button
            btnOK.Click += BtnOK_Click;

            //vincular o adaptador ao listview
            lstEstados.Adapter = adapter;

            //CRIAR O EVENTO ITEM CLICK PARA O LISTVIEW
            lstEstados.ItemClick += LstEstados_ItemClick; ;
        }

        private void BtnOK_Click(object sender, System.EventArgs e)
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

        private void LstEstados_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            int valor = e.Position;
            switch (valor)
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

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}