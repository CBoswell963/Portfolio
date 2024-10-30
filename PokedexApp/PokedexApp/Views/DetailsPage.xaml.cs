using Microsoft.Maui.Controls;
using PokedexApp.Models;

namespace PokedexApp.Views
{
    /// <summary>
    /// Details page for displaying specific Pokemon information
    /// </summary>
    public partial class DetailsPage : ContentPage
    {
        /// <summary>
        /// Initializes a new instance of the DetailsPage class
        /// </summary>
        /// <param name="pokemon">The Pokemon to display details for</param>
        public DetailsPage(Pokemon pokemon)
        {
            InitializeComponent();
            BindingContext = pokemon;// Set the binding context to the selected Pokemon
        }
    }
}
