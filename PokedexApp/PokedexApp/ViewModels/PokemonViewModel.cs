using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using PokedexApp.Models; 
using PokedexApp.Services; 

namespace PokedexApp.ViewModels
{
    /// <summary>
    /// ViewModel for handling the logic related to Pokemon data
    /// </summary>
    public class PokemonViewModel : INotifyPropertyChanged
    {
        private Pokemon _pokemon; // The currently fetched Pokemon

        /// <summary>
        /// Gets or sets the Pokemon object
        /// </summary>
        public Pokemon Pokemon
        {
            get => _pokemon;
            set
            {
                _pokemon = value;
                OnPropertyChanged(); //Notify UI of property change
            }
        }

        /// <summary>
        /// Command for fetching Pokemon data
        /// </summary>
        public ICommand FetchPokemonCommand { get; }

        /// <summary>
        /// Initializes a new instance of the PokemonViewModel class
        /// Sets up the fetch command
        /// </summary>
        public PokemonViewModel()
        {
            FetchPokemonCommand = new Command<string>(async (input) => await FetchPokemon(input));
        }

        /// <summary>
        /// Fecthes Pokemon data based on user input
        /// </summary>
        /// <param name="input">The Pokemon name or ID</param>
        /// <returns></returns>
        private async Task FetchPokemon(string input)
        {
            var service = new PokemonService(); //Instantiate the service
            Pokemon = await service.GetPokemonByIdOrName(input); // Fetch the Pokemon
        }

        /// <summary>
        /// Event raised when a property value changes
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;

        /// <summary>
        /// Raises the PropertyChanged event
        /// </summary>
        /// <param name="propertyName">The name of the property that changed</param>
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
