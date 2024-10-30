namespace PokedexApp.Models
{
    /// <summary>
    /// Represents a Pokemon and its details.
    /// </summary>
    public class Pokemon
    {
        /// <summary>
        /// Gets or sets the Pokemon's ID
        /// </summary>
        public int Id { get; set; }

        /// <summary>
        /// Gets or sets the Pokemon's name
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Gets or sets the Pokemon's image
        /// </summary>
        public string ImageUrl { get; set; }

        /// <summary>
        /// Gets or sets the Pokemon's first type
        /// </summary>
        public string Type { get; set; }
    }
}
