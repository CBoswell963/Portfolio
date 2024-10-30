using Microsoft.Maui.Controls;

namespace PokedexApp.Views
{
    /// <summary>
    /// The main page of the Pokedex App where users can search for Pokemon
    /// </summary>
    public partial class MainPage : ContentPage
    {
        /// <summary>
        /// Initializes instance of the MainPage class.
        /// Sets the binding context to PokemonViewModel
        /// </summary>
        public MainPage()
        {
            InitializeComponent();
            BindingContext = new ViewModels.PokemonViewModel();
        }
    }
}
