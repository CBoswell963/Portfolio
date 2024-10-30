using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;
using PokedexApp.Models;

namespace PokedexApp.Services
{
    public class PokemonService
    {
        /// <summary>
        /// Service for fetching Pokemon data from the external API
        /// </summary>
        private readonly HttpClient _httpClient; //HTTP client for maing requests

        /// <summary>
        /// Initializes a new instance of the PokemonService class
        /// </summary>
        public PokemonService()
        {
            _httpClient = new HttpClient(); // Instantiate the HTTP client
        }

        /// <summary>
        /// Fetches the Pokemon details based on the provided ID or name
        /// </summary>
        /// <param name="input">The Pokemon name or ID</param>
        /// <returns></returns>
        public async Task<Pokemon> GetPokemonByIdOrName(string input)
        {
            // Send a GET request to the Pokemon API
            var response = await _httpClient.GetStringAsync($"https://pokeapi.co/api/v2/pokemon/{input}");
            
            // Deserialize the JSON response into a dynamic object
            dynamic data = JsonConvert.DeserializeObject(response);

            //Return a new Pokemon instance with the data
            //Sprite used is basic front default image
            return new Pokemon
            {
                Id = data.id,
                Name = data.name,
                ImageUrl = data.sprites.front_default,
                Type = data.types[0].type.name
            };
        }
    }
}
