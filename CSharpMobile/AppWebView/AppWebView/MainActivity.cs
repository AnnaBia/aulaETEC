using Android.App;
using Android.OS;
using Android.Runtime;
using AndroidX.AppCompat.App;
using Android.Widget; // para chamar as variáveis
using Android.Webkit; // faz a WebView funcionar

namespace AppWebView
{
    [Activity(Label = "@string/app_name", Theme = "@style/AppTheme", MainLauncher = true)]
    public class MainActivity : AppCompatActivity
    {
        // Variáveis
        EditText txtUrl;
        Button btnIr;
        WebView webView1;
        string url;
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            Xamarin.Essentials.Platform.Init(this, savedInstanceState);
            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.activity_main);

            // Instâncias
            txtUrl = FindViewById<EditText>(Resource.Id.txtUrl);
            btnIr = FindViewById<Button>(Resource.Id.btnIr);
            webView1 = FindViewById<WebView>(Resource.Id.webView1);

            webView1.Settings.JavaScriptEnabled = true; // permite código JavaScript

            // evento de click do button
            btnIr.Click += BtnIr_Click;
        }

        private void BtnIr_Click(object sender, System.EventArgs e)
        {                               // Essa classe permite a leitura da Url
            webView1.SetWebViewClient(new MeuWebViewCliente()); // Permite a abertura das pág html
            url = txtUrl.Text;
            if (!url.Contains("https://")) // No caso da Url não conter o 'http'
            {
                url = "https://" + url; // acrescente ao endereço
            }
            webView1.LoadUrl(url);
        }

        public class MeuWebViewCliente : WebViewClient // Permite que a webView carregue a Url do site escolhido
        {
            [System.Obsolete]
            public override bool ShouldOverrideUrlLoading(WebView view,string url)

            {
                view.LoadUrl(url);
                return true;
            }
        }
        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Android.Content.PM.Permission[] grantResults)
        {
            Xamarin.Essentials.Platform.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }
}