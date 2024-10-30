﻿using Microsoft.Extensions.DependencyInjection;
using Microsoft.Maui.Controls.Hosting;
using Microsoft.Maui.Hosting;
using CommunityToolkit.Maui;

namespace PokedexApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>() 
                .UseMauiCommunityToolkit(); 

            

            return builder.Build();
        }
    }
}
