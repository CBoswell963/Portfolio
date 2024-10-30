using Microsoft.Maui.Controls;

namespace PokedexApp
{
    /// <summary>
    /// The main application class for the Pokedex App
    /// </summary>
    public partial class App : Application
    {
        /// <summary>
        /// Initializes a new instance of the App class.
        /// Sets the main page of the application to the main navigation page
        /// </summary>
        public App()
        {
            InitializeComponent();
            MainPage = new NavigationPage(new Views.MainPage());
        }
    }
}
