﻿using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppSaude
{
    [Activity(Label = "EngordarActivity")]
    public class EngordarActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            // Create your application here

            Label header = new Label
            {
                Text = "ContentPage",
                FontSize = 40,
                FontAttributes = FontAttributes.Bold,
                HorizontalOptions = LayoutOptions.Center
            };

            Label label1 = new Label
            {
                Text = "ContentPage is the simplest type of page.",
                FontSize = Device.GetNamedSize(NamedSize.Large, typeof(Label)),
            };

            Label label2 = new Label
            {
                Text = "The content of a ContentPage is generally a " +
                       "layout of some sort that can then be a parent " +
                       "to multiple children.",
                FontSize = Device.GetNamedSize(NamedSize.Large, typeof(Label)),
            };

            Label label3 = new Label
            {
                Text = "This ContentPage contains a StackLayout, which " +
                       "in turn contains four Label views (including the " +
                       "large one at the top)",
                FontSize = Device.GetNamedSize(NamedSize.Large, typeof(Label)),
            };

            // Build the page.
            Title = "ContentPage Demo";
            Padding = new Thickness(10, 0);
            Content = new StackLayout
            {
                Children =
                {
                    header,
                    label1,
                    label2,
                    label3
                }
            };

        }
    }
}